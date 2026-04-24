import 'package:electronics_store/features/address/controller/edit_controller.dart';
import 'package:get/get.dart';

class AddressEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressEditControllerImp());
  }
}
