import 'package:electronics_store/controller/auth/forgetpassword_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetpasswordControllerImp());
  }
}
