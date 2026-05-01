import 'package:dartz/dartz.dart';
import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/api_service.dart';

class AuthData {
  final ApiService apiService;
  AuthData(this.apiService);

  // طلب تسجيل الدخول
  Future<Either<StateRequest, Map<dynamic, dynamic>>> login(
    String email,
    String password,
  ) async {
    return await apiService.post(ApiEndpoints.login, {
      "email": email,
      "password": password,
    });
  }

  // طلب إعادة إرسال رمز التحقق
  Future<Either<StateRequest, Map<dynamic, dynamic>>> resetVerifyCode(
    String email,
  ) async {
    return await apiService.post(ApiEndpoints.checkEmail, {"email": email});
  }

  Future<Either<StateRequest, Map>> signup({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    return await apiService.post(ApiEndpoints.signup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
  }

  // تفعيل الحساب عن طريق كود التحقق
  Future<Either<StateRequest, Map>> verifyCode(
    String email,
    String verifyCode,
  ) async {
    return await apiService.post(ApiEndpoints.verifyCode, {
      "email": email,
      "verifycode": verifyCode,
    });
  }

  // المرحلة الأولى: التأكد من وجود البريد الإلكتروني لإرسال رمز التحقق
  Future<Either<StateRequest, Map>> checkEmail(String email) async {
    return await apiService.post(ApiEndpoints.checkEmail, {"email": email});
  }

  //  تعيين كلمة المرور الجديدة
  Future<Either<StateRequest, Map>> resetPassword(
    String email,
    String password,
  ) async {
    return await apiService.post(ApiEndpoints.resetPassword, {
      "email": email,
      "password": password,
    });
  }
}
