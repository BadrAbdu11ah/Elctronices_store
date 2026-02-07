import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/verfiy_code_data.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:get/get.dart';

abstract class VerfiyCodePasswordController extends GetxController {
  void verfiyCodePassword(String verificationCode);
}

class VerfiyCodePasswordControllerImp extends VerfiyCodePasswordController {
  // أخذ الإيميل من الأرقمنت
  String? email;

  // ربط طبقة البيانات بالمتحكم
  VerfiyCodeData verfiyCodeData = VerfiyCodeData(Get.find());

  // متغير لمراقبة حالة الطلب (تحميل، نجاح، خطأ)
  StateRequest stateRequest = StateRequest.none;

  MyService myService = Get.find();

  @override
  void verfiyCodePassword(String verificationCode) async {
    stateRequest = StateRequest.loading;
    update();

    if (email == null) {
      stateRequest = StateRequest.serverfailure;
      update();
      return;
    }

    final response = await verfiyCodeData.postVerfiyCodeDataAndGet(
      email!,
      verificationCode,
    );

    stateRequest = handlingData(response);

    if (stateRequest != StateRequest.success) {
      update();
      return;
    }

    // نجاح كامل
    if (response["status"] == "success") {
      Get.offNamed(MyPages.resetPassword);
      update();
      return;
    }

    // أي خطأ آخر من السيرفر (errorKey)
    Get.defaultDialog(
      title: MyText.warning.tr,
      middleText: response["errorKey"].toString().tr,
    );

    update();
  }

  @override
  void onInit() {
    email = myService.sharedPreferences.getString("emailforget");
    super.onInit();
  }
}
