import 'package:electronics_store/features/auth/pages/forget_password/controller/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetpasswordControllerImp());
  }
}
