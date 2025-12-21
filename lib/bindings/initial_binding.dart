import 'package:electronics_store/core/localization/change_local.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocaleController());
  }
}
