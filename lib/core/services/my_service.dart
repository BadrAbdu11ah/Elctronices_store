import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreferences;
  // يوضع هنا ما يتم جلبه في بداية التطبيق
  Future<MyService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

// تهيئة توضع في الماين
Future<void> initialService() async {
  await Get.putAsync(() => MyService().init());
}
