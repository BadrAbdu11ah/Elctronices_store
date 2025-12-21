import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeSignUpController extends GetxController {
  void verfiyCodeSignUp();
  void goToSuccessSignUp();
}

class VerfiyCodeSignUpControllerImp extends VerfiyCodeSignUpController {
  @override
  verfiyCodeSignUp() {}

  @override
  goToSuccessSignUp() {
    Get.offAllNamed(MyPages.successSignUp);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
