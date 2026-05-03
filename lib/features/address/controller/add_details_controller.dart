import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/address/data/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressAddDetailsController extends GetxController {
  // Dependencies
  MyService myService = Get.find();
  AddressData addressData = AddressData(Get.find());

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Form Properties
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController phone;
  late String lat;
  late String long;

  // Methods
  void initialData();
  void addData();
}

class AddressAddDetailsControllerImp extends AddressAddDetailsController {
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    city.dispose();
    street.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  void initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    phone = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    update();
  }

  @override
  Future<void> addData() async {
    // التحقق من صحة المدخلات في الواجهة أولاً
    // if (formstate.currentState?.validate() != true) return;

    // 1. تحديث الحالة إلى "جاري التحميل"
    stateRequest = StateRequest.loading;
    update();

    // 2. طلب البيانات من السيرفر (إرسال البيانات كـ Map)
    var response = await addressData.addAddress({
      "name": name.text,
      "city": city.text,
      "street": street.text,
      "lat": lat.toString(),
      "long": long.toString(),
      "phone": phone.text,
    });

    // 3. فحص الرد (هل هو بيانات أم خطأ اتصال؟)
    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) {
        if (data['status'] == "failure") {
          stateRequest = StateRequest.failure;
          Get.defaultDialog(
            title: "تنبيه",
            middleText: data['message'] ?? "فشلت العملية",
          );
          update();
          return;
        }

        // 4. في حالة النجاح
        Get.defaultDialog(title: "نجاح", middleText: data['message']);
        stateRequest = StateRequest.success;
        Get.offAllNamed(MyPages.homeScreen);

        update();
      },
    );
  }
}
