import 'package:electronics_store/controller/address/view_controller.dart';
import 'package:get/get.dart';

class AddressViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressViewControllerImp());
  }
}
