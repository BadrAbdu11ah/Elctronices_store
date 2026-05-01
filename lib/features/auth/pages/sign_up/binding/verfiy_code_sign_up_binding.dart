import 'package:electronics_store/features/auth/pages/sign_up/controller/verfiy_code_sign_up_controller.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerfiyCodeSignUpControllerImp());
  }
}
