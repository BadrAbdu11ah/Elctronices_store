import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/verfiy_code_data.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeSignUpController extends GetxController {
  void verfiyCodeSignUp(String verificationCode);
}

class VerfiyCodeSignUpControllerImp extends VerfiyCodeSignUpController {
  // أخذ الإيميل من الشيرد
  String? email;

  // ربط طبقة البيانات بالمتحكم
  VerfiyCodeData verfiyCodeData = VerfiyCodeData(Get.find());

  MyService myService = Get.find();

  // متغير لمراقبة حالة الطلب (تحميل، نجاح، خطأ)
  StateRequest stateRequest = StateRequest.none;

  @override
  void verfiyCodeSignUp(String verificationCode) async {
    stateRequest = StateRequest.loading;
    update();

    if (email == null) {
      stateRequest = StateRequest.serverfailure;
      update();
      return;
    }
    print("============= email: $email");
    print("============= verificationCode: $verificationCode");
    final response = await verfiyCodeData.postVerfiyCodeDataAndGet(
      email!,
      verificationCode,
    );
    print("======================verfiycode: $response");
    stateRequest = handlingData(response);

    if (stateRequest != StateRequest.success) {
      update();
      return;
    }

    // نجاح كامل
    if (response["status"] == "success") {
      myService.sharedPreferences.remove('emailsignup');
      Get.offAllNamed(MyPages.successSignUp);
      update();
      return;
    }

    Get.defaultDialog(
      title: MyText.warning.tr,
      middleText: response["errorKey"].toString().tr,
    );

    update();
  }

  @override
  void onInit() {
    email = myService.sharedPreferences.getString('emailsignup');
    super.onInit();
  }
}
