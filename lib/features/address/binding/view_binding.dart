import 'package:electronics_store/features/address/controller/view_controller.dart';
import 'package:get/get.dart';

class AddressViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressViewControllerImp());
  }
}
