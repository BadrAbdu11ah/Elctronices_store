import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/auth/data/auth_data.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:electronics_store/features/auth/service/auth_service.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeSignUpController extends GetxController {
  // Dependencies
  final AuthService authService = Get.find<AuthService>();
  final AuthData authData = AuthData(Get.find());
  MyService myService = Get.find();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Data Properties
  String? email;

  // Methods
  void verfiyCodeSignUp(String verificationCode);
}

class VerfiyCodeSignUpControllerImp extends VerfiyCodeSignUpController {
  @override
  void onInit() {
    // جلب الإيميل المحفوظ مؤقتاً
    email = myService.sharedPreferences.getString('emailsignup');
    super.onInit();
  }

  @override
  void verfiyCodeSignUp(String verificationCode) async {
    if (email == null) {
      Get.snackbar(MyText.error, "لم يتم العثور على البريد الإلكتروني");
      return;
    }

    stateRequest = StateRequest.loading;
    update();

    // 1. إرسال الطلب للسيرفر
    var response = await authData.verifyCode(email!, verificationCode);

    // 2. معالجة الرد باستخدام fold
    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) async {
        if (data["status"] == "failure") {
          // حالة الكود خاطئ
          stateRequest = StateRequest.none;
          Get.defaultDialog(
            title: MyText.warning.tr,
            middleText: data["errorKey"].toString().tr,
          );
          update();
          return;
        }

        // حالة الكود صحيح
        stateRequest = StateRequest.success;

        await myService.sharedPreferences.remove('emailsignup');

        await authService.saveAuthData(Map<String, dynamic>.from(data));

        Get.offAllNamed(MyPages.successSignUp);

        update();
      },
    );
  }
}
