import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/api_service.dart';
import 'package:electronics_store/data/datasurce/remote/auth_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // الاعتماد على ApiService و AuthData
  final ApiService api = Get.find<ApiService>();
  late AuthData authData;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  late StateRequest stateRequest;

  // تخزين بيانات المستخدم بشكل مركزي
  Map<String, dynamic> user = {};

  // Getters للوصول السريع لبيانات المستخدم
  String get role =>
      user['users_role']?.toString() ??
      '0'; // في المتجر عادة 0 للمستخدم و 1 للآدمن
  bool get isAdmin => role == '1';

  @override
  void onInit() {
    authData = AuthData(api);
    super.onInit();
  }

  // حفظ التوكن وبيانات المستخدم عند نجاح الدخول أو الاشتراك
  Future<void> saveAuthData(Map<String, dynamic> data) async {
    final token = data['token']?.toString();
    if (token != null && token.isNotEmpty) {
      await storage.write(key: 'token', value: token);
    }

    final userData = data['data'];
    if (userData is Map<String, dynamic>) {
      user = userData;
    }

    update();
  }

  // حذف البيانات عند تسجيل الخروج
  Future<void> deleteAuthData() async {
    await storage.delete(key: 'token');
    user = {};
    update();
  }

  // دالة تسجيل الدخول
  Future<StateRequest> login({
    required String email,
    required String password,
  }) async {
    final response = await authData.login(email.trim(), password);

    response.fold(
      (failure) {
        stateRequest = failure;
      },
      (data) {
        saveAuthData(data);
        stateRequest = StateRequest.success;
      },
    );

    return stateRequest;
  }

  // دالة إنشاء الحساب (Signup)
  Future<StateRequest> signup({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    final response = await authData.signup(
      username.trim(),
      email.trim(),
      password,
      phone.trim(),
    );

    response.fold(
      (failure) {
        stateRequest = failure;
      },
      (data) {
        // في المتجر أحياناً تحتاج لتفعيل الحساب أولاً قبل الحفظ الكامل
        // إذا كان السيرفر يرسل التوكن فوراً نستخدم saveAuthData
        saveAuthData(data);
        stateRequest = StateRequest.success;
      },
    );

    return stateRequest;
  }

  // جلب بيانات المستخدم الحالي (Profile)
  Future<StateRequest> checkUserStatus() async {
    // نفترض وجود endpoint اسمه 'me' أو 'check_status' في المتجر
    final response = await api.get('/me');

    response.fold(
      (failure) {
        stateRequest = failure;
      },
      (data) {
        final userData = data['data'];
        if (userData is Map<String, dynamic>) {
          user = userData;
        }
        stateRequest = StateRequest.success;
      },
    );

    update();
    return stateRequest;
  }

  // تسجيل الخروج
  Future<StateRequest> logout() async {
    // يمكن استدعاء API تسجيل الخروج إذا كان السيرفر يدعم ذلك (مثل Laravel Sanctum)
    final response = await api.post('/logout', {});

    response.fold(
      (failure) => stateRequest = failure,
      (_) => stateRequest = StateRequest.success,
    );

    await deleteAuthData();
    return stateRequest;
  }
}
