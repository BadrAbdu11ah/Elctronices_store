import 'package:electronics_store/controller/favorite/favorite_controller.dart';
import 'package:electronics_store/controller/favorite/favorite_page_controller.dart';
import 'package:get/get.dart';

class FavoritePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritePageControllerImp());
    Get.lazyPut(() => FavoriteControllerImp());
  }
}
