import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestService extends GetxService {
  late SharedPreferences sharedPreferences;
  // يوضع هنا ما يتم جلبه في بداية التطبيق
  Future<TestService> init() async {
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

// تهيئة توضع في الماين
Future<void> initialTestService() async {
  await Get.putAsync(() => TestService().init());
}
