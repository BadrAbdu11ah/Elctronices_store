import 'package:electronics_store/controller/address/edit_controller.dart';
import 'package:get/get.dart';

class AddressEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressEditControllerImp());
  }
}
