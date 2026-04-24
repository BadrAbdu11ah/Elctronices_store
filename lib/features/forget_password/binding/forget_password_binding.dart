import 'package:electronics_store/features/forget_password/controller/forgetpassword_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetpasswordControllerImp());
  }
}
