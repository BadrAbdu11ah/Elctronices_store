import 'package:electronics_store/features/favorite/controller/favorite_page_controller.dart';
import 'package:get/get.dart';

class FavoritePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritePageControllerImp());
  }
}
