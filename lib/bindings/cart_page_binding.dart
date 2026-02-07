import 'package:electronics_store/controller/cart/cart_controller.dart';
import 'package:electronics_store/controller/cart/cart_page_controller.dart';
import 'package:get/get.dart';

class CartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartPageControllerImp());
    Get.lazyPut(() => CartControllerImp());
  }
}
