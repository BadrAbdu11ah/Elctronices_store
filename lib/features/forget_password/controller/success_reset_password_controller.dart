import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Methods
  void goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(MyPages.login);
  }
}
