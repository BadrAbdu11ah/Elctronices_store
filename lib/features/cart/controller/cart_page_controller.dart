import 'package:electronics_store/features/cart/controller/cart_helper_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/data/model/cart_model.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartPageController extends CartHelperControllerImp {
  // methods
  Future<void> getCart();
  Future<void> addCart(int index, String itemsid);
  Future<void> removeCart(int index, String itemsid);
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
    getCart();
    super.onInit();
  }

  @override
  void onClose() {
    product.dispose();
    coupon.dispose();
    super.onClose();
  }

  @override
  Future<void> getCart() async {
    stateRequest = StateRequest.loading;
    update();

    var response = await cartData.viewCart();

    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) {
        stateRequest = StateRequest.success;
        resetCart();

        items.addAll(data['items'] as List<CartModel>);

        // تعبئة مصفوفات التحكم بناءً على البيانات المستلمة
        countItem.addAll(items.map((e) => e.countItems ?? 0));
        totalItemPrice.addAll(
          items.map((e) => double.tryParse(e.totalItemPrice.toString()) ?? 0.0),
        );
        isUpdating.addAll(List.filled(items.length, false));

        // تحديث الإجماليات
        originalPrice = data['totalprice'];
        subtotalPrice = originalPrice;
        countAll = data['countall'];

        recalculateTotals();
        update();
      },
    );
  }

  @override
  Future<void> addCart(int index, String itemId) async {
    if (isUpdating[index]) return;

    isUpdating[index] = true;
    applyLocalChange(index, 1);
    update();

    var response = await cartData.addCart(int.parse(itemId));

    response.fold(
      (failure) {
        applyLocalChange(index, -1);
        isUpdating[index] = false;
        update();
      },
      (success) {
        isUpdating[index] = false;
        update();
      },
    );
  }

  @override
  Future<void> removeCart(int index, String itemId) async {
    if (isUpdating[index] || countItem[index] <= 0) return;

    isUpdating[index] = true;
    applyLocalChange(index, -1);
    update();

    var response = await cartData.removeCart(int.parse(itemId));

    response.fold(
      (failure) {
        applyLocalChange(index, 1);
        isUpdating[index] = false;
        update();
      },
      (success) {
        // حذف العنصر نهائياً من الواجهة إذا وصل الصفر
        if (countItem[index] <= 0) {
          _deleteItem(index);
        } else {
          isUpdating[index] = false;
        }
        update();
      },
    );
  }

  void _deleteItem(int index) {
    items.removeAt(index);
    isUpdating.removeAt(index);
    countItem.removeAt(index);
    totalItemPrice.removeAt(index);
  }

  @override
  void checkCoupon(String couponsname) async {
    if (coupon.text.isEmpty) return;

    stateRequest = StateRequest.loading;
    update();

    var response = await cartData.checkCoupon(couponsname);

    response.fold(
      (failure) {
        discount = 0;
        couponsName = null;
        couponsid = null;
        Get.snackbar("تنبيه", "الكوبون غير صالح أو انتهت صلاحيته");
        stateRequest = StateRequest.none;
        update();
      },
      (couponModelData) {
        stateRequest = StateRequest.success;
        couponModel = couponModelData;
        couponsName = couponModel.couponsName;
        couponsid = couponModel.couponsId.toString();
        discount = couponModel.couponsDiscount ?? 0;

        applyCoupon();
        update();
      },
    );
  }

  @override
  void goToItemsDetails(itemsModel) {
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void goToCheckOut() {
    if (Get.isSnackbarOpen || items.isEmpty) return;

    Get.toNamed(
      MyPages.checkOut,
      arguments: {
        'couponsid': couponsid ?? "0",
        'priceorders': subtotalPrice.toString(),
      },
    );
  }

  @override
  void deleteItem(int index) {
    // منطق الحذف الكامل للمنتج (اختياري)
  }
}
