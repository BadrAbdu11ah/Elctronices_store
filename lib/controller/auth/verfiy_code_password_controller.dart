import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:get/get.dart';

abstract class VerfiyCodePasswordController extends GetxController {
  void verfiyCodePassword();
  void goToResetpassword();
}

class VerfiyCodePasswordControllerImp extends VerfiyCodePasswordController {
  @override
  verfiyCodePassword() {}

  @override
  goToResetpassword() {
    Get.offNamed(MyPages.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
