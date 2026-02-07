import 'package:electronics_store/controller/cart/cart_controller.dart';
import 'package:electronics_store/controller/items/items_details_controller.dart';
import 'package:get/get.dart';

class ItemsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsDetailsControllerImp());
    Get.lazyPut(() => CartControllerImp());
  }
}
