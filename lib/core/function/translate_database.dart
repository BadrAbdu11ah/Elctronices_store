import 'package:electronics_store/core/services/my_service.dart';
import 'package:get/get.dart';

dynamic translateDatabase(String columnen, String columnar) {
  MyService myService = Get.find();
  if (myService.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  }
  return columnen;
}
