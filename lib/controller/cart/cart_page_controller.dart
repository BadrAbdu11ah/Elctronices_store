import 'package:electronics_store/controller/cart/cart_helper_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/data/model/cart_model.dart';
import 'package:electronics_store/data/model/coupon_model.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartPageController extends CartHelperControllerImp {
  Future<void> getData();
  Future<void> addCount(int index, String itemsid);
  Future<void> removeCount(int index, String itemsid);
  void checkCoupon(String couponsName);
  void deleteItem(int index);
  void goToItemsDetails(ItemsModel itemsModel);
  void goToCheckOut();
}

class CartPageControllerImp extends CartPageController {
  @override
  void onInit() {
    lang = myService.sharedPreferences.getString('lang');
    product = TextEditingController();
    coupon = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    product.dispose();
    coupon.dispose();
    super.onClose();
  }

  @override
  Future<void> getData() async {
    resetCart();
    stateRequest = StateRequest.loading;
    update();

    final response = await cartData.viewCart(
      myService.sharedPreferences.getString("id")!,
    );

    stateRequest = handlingData(response);

    if (stateRequest != StateRequest.success) {
      update();
      return;
    }
    if (response['status'] != "success") {
      stateRequest = StateRequest.failure;
      update();
      return;
    }
    final List data = response['data'] ?? [];

    items.addAll(data.map((e) => CartModel.fromJson(e)));

    countItem.addAll(items.map((e) => e.countItems ?? 0));

    totalItemPrice.addAll(items.map((e) => e.totalItemPrice ?? 0));

    isUpdating.addAll(List.filled(items.length, false));

    originalPrice = double.tryParse(response['totalprice'].toString()) ?? 0.0;
    price = originalPrice;
    countAll = int.tryParse(response['countall'].toString()) ?? 0;
    recalculateTotals();

    update();
  }

  @override
  Future<void> addCount(int index, String itemId) async {
    // زيادة عدد منتج
    if (isUpdating[index]) return; // منع التحديث المتكرر

    isUpdating[index] = true; // قفل العنصر
    applyLocalChange(index, 1); // تحديث فوري للواجهة
    update();

    final success = await cartController.add(itemId); // إرسال الطلب للسيرفر
    if (!success) {
      applyLocalChange(index, -1); // rollback في حال الفشل
    }

    isUpdating[index] = false; // فتح القفل
    update(); // تحديث الواجهة
  }

  @override
  Future<void> removeCount(int index, String itemId) async {
    print("====== index: $index");

    if (isUpdating[index]) return;

    if (countItem[index] <= 0) {
      return;
    }

    isUpdating[index] = true;
    applyLocalChange(index, -1);
    update();

    final success = await cartController.remove(itemId);

    if (!success) {
      applyLocalChange(index, 1);
    }
    if (countItem[index] <= 0) {
      items.removeAt(index);
      isUpdating.removeAt(index);
      countItem.removeAt(index);
      totalItemPrice.removeAt(index);
    }

    if (index < isUpdating.length) {
      isUpdating[index] = false;
    }
    update();
  }

  @override
  void checkCoupon(String couponsname) async {
    if (coupon.text.isEmpty) return;
    stateRequest = StateRequest.loading;
    update();

    final response = await cartData.checkCoupon(couponsname);
    if (response['status'] == "failure") {
      discount = 0;
      couponsName = null;
      couponsName = null;
      Get.snackbar("Wroning", "The coupon is invalid");
      stateRequest = StateRequest.none;
      update();
      return;
    }
    Map<String, dynamic> responseData = response['data'];
    couponModel = CouponModel.fromJson(responseData);
    couponsName = couponModel.couponsName!;
    couponsid = couponModel.couponsId.toString();

    discount = couponModel.couponsDiscount!;

    applyCoupon();
    stateRequest = StateRequest.success;
    update();
  }

  @override
  void goToItemsDetails(itemsModel) {
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void goToCheckOut() {
    if (Get.isSnackbarOpen) return;

    if (items.isEmpty) {
      Get.snackbar("تنبيه", "لا توجد عناصر");
      return;
    }

    Get.toNamed(
      MyPages.checkOut,
      arguments: {
        'couponsid': couponsid,
        'priceorders': originalPrice.toString(),
      },
    );
  }

  @override
  void deleteItem(int index) {}
}
