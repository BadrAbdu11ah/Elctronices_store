import 'package:electronics_store/controller/address/add_details_controller.dart';
import 'package:get/get.dart';

class AddressAddDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressAddDetailsControllerImp());
  }
}
