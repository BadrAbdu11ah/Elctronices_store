import 'package:electronics_store/features/orders/controller/pending_controller.dart';
import 'package:get/get.dart';

class OrdersPendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersPendingControllerImp());
  }
}
