import 'package:electronics_store/controller/orders/details_controller.dart';
import 'package:get/get.dart';

class OrdersDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersDetailsControllerImp());
  }
}
