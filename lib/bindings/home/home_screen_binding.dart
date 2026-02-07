import 'package:electronics_store/controller/favorite/favorite_controller.dart';
import 'package:electronics_store/controller/home/home_page_controller.dart';
import 'package:electronics_store/controller/home/home_screen_controller.dart';
import 'package:electronics_store/controller/home/profile_controller.dart';
import 'package:electronics_store/controller/home/settings_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageControllerImp(), fenix: true);
    Get.lazyPut(() => FavoriteControllerImp(), fenix: true);
    Get.lazyPut(() => SettingsControllerImp(), fenix: true);
    Get.lazyPut(() => ProfileControllerImp(), fenix: true);
    Get.put(HomeScreenControllerImp());
  }
}
