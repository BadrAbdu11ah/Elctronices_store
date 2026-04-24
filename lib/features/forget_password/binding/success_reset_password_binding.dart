import 'package:electronics_store/features/forget_password/controller/success_reset_password_controller.dart';
import 'package:get/get.dart';

class SuccessResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessResetPasswordControllerImp());
  }
}
