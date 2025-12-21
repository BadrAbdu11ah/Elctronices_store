import 'package:electronics_store/controller/auth/verfiy_code_sign_up_controller.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerfiyCodeSignUpControllerImp());
  }
}
