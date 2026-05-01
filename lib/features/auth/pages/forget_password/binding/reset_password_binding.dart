import 'package:electronics_store/features/auth/pages/forget_password/controller/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordControllerImp());
  }
}
