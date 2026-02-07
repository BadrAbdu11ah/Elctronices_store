import 'package:electronics_store/controller/favorite/favorite_controller.dart';
import 'package:electronics_store/controller/items/items_controller.dart';
import 'package:get/get.dart';

class ItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsControllerImp());
    Get.lazyPut(() => FavoriteControllerImp());
  }
}
