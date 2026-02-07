import 'package:electronics_store/controller/orders/pending_controller.dart';
import 'package:get/get.dart';

class OrdersPendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersPendingControllerImp());
  }
}
