import 'package:electronics_store/controller/check_out_controller.dart';
import 'package:get/get.dart';

class CheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckOutControllerImp());
  }
}
