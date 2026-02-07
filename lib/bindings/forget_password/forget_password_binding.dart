import 'package:electronics_store/controller/forget_password/forgetpassword_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetpasswordControllerImp());
  }
}
