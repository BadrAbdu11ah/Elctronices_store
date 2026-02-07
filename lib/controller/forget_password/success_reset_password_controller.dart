import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  void goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  StateRequest stateRequest = StateRequest.none;
  @override
  goToLogin() {
    Get.offAllNamed(MyPages.login);
  }
}
