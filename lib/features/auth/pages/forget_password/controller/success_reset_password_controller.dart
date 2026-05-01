import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  // Methods
  void goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  void onInit() {
    // الانتقال التلقائي للرئيسية بعد 3 ثوانٍ
    Future.delayed(const Duration(seconds: 3), () {
      goToLogin();
    });
    super.onInit();
  }

  @override
  void goToLogin() {
    Get.offAllNamed(MyPages.login);
  }
}
