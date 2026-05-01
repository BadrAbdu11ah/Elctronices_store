import 'package:electronics_store/data/static/my_text.dart';
import 'package:get/get.dart';

void showServerError(Map<String, dynamic> response) {
  Get.defaultDialog(
    title: MyText.warning.tr,
    middleText: response["errorKey"].toString().tr,
  );
}
