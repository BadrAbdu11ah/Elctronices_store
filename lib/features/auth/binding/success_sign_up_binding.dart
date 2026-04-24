import 'package:electronics_store/features/auth/controller/success_sign_up_controller.dart';
import 'package:get/get.dart';

class SuccessSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessSignUpControllerImp());
  }
}
