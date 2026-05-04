import 'package:electronics_store/features/favorite/controller/favorite_page_controller.dart';
import 'package:electronics_store/features/home/controller/home_page_controller.dart';
import 'package:electronics_store/features/home/controller/home_screen_controller.dart';
import 'package:electronics_store/features/home/controller/profile_controller.dart';
import 'package:electronics_store/features/home/controller/settings_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageControllerImp(), fenix: true);
    Get.lazyPut(() => FavoritePageControllerImp(), fenix: true);
    Get.lazyPut(() => SettingsControllerImp(), fenix: true);
    Get.lazyPut(() => ProfileControllerImp(), fenix: true);
    Get.put(HomeScreenControllerImp());
  }
}
