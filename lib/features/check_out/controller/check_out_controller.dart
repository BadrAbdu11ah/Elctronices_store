import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/address/data/address_data.dart';
import 'package:electronics_store/features/check_out/data/checkout_data.dart';
import 'package:electronics_store/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckOutController extends GetxController {
  // Dependencies
  MyService myService = Get.find();
  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Selection Properties
  String? paymentMethod;
  String? deliveryType;
  String? addressID;

  // Order Details
  late String couponsID;
  late String priceOrders;

  // Data Lists
  List<AddressModel> addressModel = [];

  // Methods
  void getAddresses();
  void choosePymentMethod(String val);
  void chooseDeliveryType(String val);
  void chooseShippingAddress(String val);
  void checkout();
}

class CheckOutControllerImp extends CheckOutController {
  @override
  void onInit() {
    super.onInit();
    couponsID = Get.arguments['couponsid'] ?? "0";
    priceOrders = Get.arguments['priceorders'].toString();
    getAddresses();
  }

  @override
  void choosePymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  @override
  void chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  void chooseShippingAddress(String val) {
    addressID = val;
    update();
  }

  @override
  void getAddresses() async {
    stateRequest = StateRequest.loading;
    update();

    var response = await addressData.getAddresses();

    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) {
        stateRequest = StateRequest.success;
        addressModel.clear();
        addressModel.addAll(data);
        update();
      },
    );
  }

  @override
  void checkout() async {
    // 1. التحقق من المدخلات (Validation)
    if (paymentMethod == null) {
      Get.snackbar("تنبيه", "يرجى اختيار طريقة الدفع");
      return;
    }
    if (deliveryType == null) {
      Get.snackbar("تنبيه", "يرجى اختيار نوع الاستلام");
      return;
    }
    if (deliveryType == "0" && addressID == null) {
      Get.snackbar("تنبيه", "يرجى اختيار عنوان التوصيل");
      return;
    }

    // 2. تجهيز البيانات
    Map<String, dynamic> data = {
      'addressesid': addressID ?? "0",
      'type': deliveryType,
      'pricedelivery': "20",
      'price': priceOrders,
      'couponsid': couponsID,
      'paymentmethod': paymentMethod,
    };

    stateRequest = StateRequest.loading;
    update();

    // 3. استدعاء طبقة البيانات
    var response = await checkoutData.checkout(data);

    // 4. معالجة الرد
    response.fold(
      (failure) {
        stateRequest = failure;
        Get.snackbar("خطأ", "فشل الاتصال بالسيرفر، حاول مجدداً");
        update();
      },
      (data) {
        // حالة فشل الكوبون
        if (data['status'] == "failure" &&
            data['message'] == "الكوبون لم يعد صالحاً") {
          stateRequest = StateRequest.none;
          Get.snackbar("خطأ في الكوبون", data['message']);
          // Get.offAllNamed(MyPages.cart);
          update();
          return;
        }

        // حالة فشل عامة
        if (data['status'] != "success") {
          stateRequest = StateRequest.none;
          Get.snackbar("خطأ", data['message'] ?? "حدث خطأ ما، حاول لاحقاً");
          update();
          return;
        }

        // حالة النجاح الكامل
        stateRequest = StateRequest.success;
        Get.offAllNamed(MyPages.homeScreen);

        // عرض رسالة النجاح
        Get.snackbar(
          "تم بنجاح",
          data['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 4),
        );
      },
    );
  }
}
