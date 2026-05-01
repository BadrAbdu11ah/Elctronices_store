import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Map<String, dynamic> user = {};

  // Getters للوصول السريع لبيانات المستخدم من أي مكان في التطبيق
  // 0 للمستخدم و 1 للآدمن
  String get role => user['users_role']?.toString() ?? '0';
  bool get isAdmin => role == '1';
  bool get isUserLoggedIn => user.isNotEmpty;

  // 1. حفظ التوكن وبيانات المستخدم
  Future<void> saveAuthData(Map<String, dynamic> responseData) async {
    // تخزين التوكن في التخزين الآمن
    final token = responseData['token']?.toString();
    if (token != null && token.isNotEmpty) {
      await storage.write(key: 'token', value: token);
    }

    // تحديث بيانات المستخدم في الذاكرة
    final userData = responseData['data'];
    if (userData is Map<String, dynamic>) {
      user = userData;
    }

    update(); // تحديث أي واجهة تستمع لهذا الـ Service
  }

  // 2. تحديث بيانات المستخدم فقط (بدون التوكن)
  void setUserData(Map<String, dynamic> userData) {
    user = userData;
    update();
  }

  // 3. حذف البيانات عند تسجيل الخروج أو انتهاء الجلسة
  Future<void> deleteAuthData() async {
    await storage.delete(key: 'token');
    user = {};
    update();
  }

  // 4. جلب التوكن
  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
}
