import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/auth/data/auth_data.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:get/get.dart';

abstract class VerfiyCodePasswordController extends GetxController {
  // Dependencies
  final AuthData authData = AuthData(Get.find());
  final MyService myService = Get.find();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Data Properties
  String? email;

  // Methods
  void verfiyCodePassword(String verificationCode);
}

class VerfiyCodePasswordControllerImp extends VerfiyCodePasswordController {
  // الاعتماد على البيانات الموحدة

  @override
  void onInit() {
    // جلب الإيميل المحفوظ من المرحلة السابقة
    email = myService.sharedPreferences.getString("emailforget");
    super.onInit();
  }

  @override
  void verfiyCodePassword(String verificationCode) async {
    if (email == null) {
      Get.snackbar(MyText.error, "حدث خطأ في البيانات، يرجى المحاولة من جديد");
      return;
    }

    stateRequest = StateRequest.loading;
    update();

    // 1. طلب التحقق من الكود
    var response = await authData.verifyCode(email!, verificationCode);

    // 2. معالجة الرد
    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) async {
        if (data["status"] == "failure") {
          // حالة الكود غير صحيح أو منتهي الصلاحية
          stateRequest = StateRequest.none;
          Get.defaultDialog(
            title: MyText.warning.tr,
            middleText: data["errorKey"].toString().tr,
          );
          update();
          return;
        }

        stateRequest = StateRequest.success;
        // تعيين كلمة المرور الجديدة
        Get.offNamed(MyPages.resetPassword);
        update();
      },
    );
  }
}
