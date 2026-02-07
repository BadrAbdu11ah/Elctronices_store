import 'package:electronics_store/controller/forget_password/success_reset_password_controller.dart';
import 'package:get/get.dart';

class SuccessResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessResetPasswordControllerImp());
  }
}
