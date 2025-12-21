import 'package:electronics_store/controller/auth/verfiy_code_password_controller.dart';
import 'package:get/get.dart';

class VerfiyCodePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerfiyCodePasswordControllerImp());
  }
}
