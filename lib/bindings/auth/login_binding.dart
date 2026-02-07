import 'package:electronics_store/controller/auth/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControllerImp());
  }
}
