import 'package:electronics_store/features/address/controller/add_controller.dart';
import 'package:get/get.dart';

class AddressAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressAddControllerImp());
  }
}
