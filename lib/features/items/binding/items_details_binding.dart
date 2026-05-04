import 'package:electronics_store/features/items/controller/items_details_controller.dart';
import 'package:get/get.dart';

class ItemsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsDetailsControllerImp());
  }
}
