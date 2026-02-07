import 'package:electronics_store/controller/test_view_controller.dart';
import 'package:get/get.dart';

class TestViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestViewController());
  }
}
