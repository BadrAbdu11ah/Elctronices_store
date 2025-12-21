import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  void goToLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToLogin() {
    Get.offAllNamed(MyPages.login);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
