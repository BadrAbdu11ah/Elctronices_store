import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';

class AuthData {
  final ApiService api;

  AuthData(this.api);

  // 1. تسجيل الدخول
  Future login(String email, String password) async {
    var response = await api.post(ApiEndpoints.login, {
      "email": email,
      "password": password,
    }, auth: false);
    return response.fold((l) => l, (r) => r);
  }

  // 2. إنشاء حساب جديد
  Future signup(
    String username,
    String email,
    String password,
    String phone,
  ) async {
    var response = await api.post(ApiEndpoints.signup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    }, auth: false);
    return response.fold((l) => l, (r) => r);
  }

  // // 3. التحقق من الكود (Verify Code)
  Future verifyCode(String email, String verifycode) async {
    var response = await api.post(ApiEndpoints.verifyCode, {
      "email": email,
      "verifycode": verifycode,
    }, auth: false);
    return response.fold((l) => l, (r) => r);
  }

  // // 4. إعادة إرسال الكود / فحص الإيميل
  Future resendVerifyCode(String email) async {
    var response = await api.post(ApiEndpoints.checkEmail, {
      "email": email,
    }, auth: false);
    return response.fold((l) => l, (r) => r);
  }

  // // 5. إعادة تعيين كلمة المرور
  Future resetPassword(String email, String password) async {
    var response = await api.post(ApiEndpoints.resetPassword, {
      "email": email,
      "password": password,
    }, auth: false);
    return response.fold((l) => l, (r) => r);
  }
}
