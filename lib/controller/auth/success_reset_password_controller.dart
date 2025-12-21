import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  void goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(MyPages.login);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
