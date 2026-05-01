import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  // Methods
  void goToHome();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  void onInit() {
    // الانتقال التلقائي للرئيسية بعد 3 ثوانٍ
    Future.delayed(const Duration(seconds: 3), () {
      goToHome();
    });
    super.onInit();
  }

  @override
  void goToHome() {
    Get.offAllNamed(MyPages.homeScreen);
  }
}
