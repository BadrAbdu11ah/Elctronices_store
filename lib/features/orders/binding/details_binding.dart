import 'package:electronics_store/features/orders/controller/details_controller.dart';
import 'package:get/get.dart';

class OrdersDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersDetailsControllerImp());
  }
}
