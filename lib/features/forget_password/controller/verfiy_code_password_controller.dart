import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/auth/data/verfiy_code_data.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:get/get.dart';

abstract class VerfiyCodePasswordController extends GetxController {
  // Dependencies
  VerfiyCodeData verfiyCodeData = VerfiyCodeData(Get.find());
  MyService myService = Get.find();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Data Properties
  String? email;

  // Methods
  void verfiyCodePassword(String verificationCode);
}

class VerfiyCodePasswordControllerImp extends VerfiyCodePasswordController {
  @override
  void onInit() {
    email = myService.sharedPreferences.getString("emailforget");
    super.onInit();
  }

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
}
