import 'package:electronics_store/features/items/controller/items_controller.dart';
import 'package:get/get.dart';

class ItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsControllerImp());
  }
}
