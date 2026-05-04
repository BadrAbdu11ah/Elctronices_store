import 'package:electronics_store/features/cart/controller/cart_page_controller.dart';
import 'package:get/get.dart';

class CartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartPageControllerImp());
  }
}
