import 'package:electronics_store/features/test/test_view_controller.dart';
import 'package:get/get.dart';

class TestViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestViewController());
  }
}
