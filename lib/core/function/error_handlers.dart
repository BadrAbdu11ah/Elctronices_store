import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:get/get.dart';

void showServerError(Map<String, dynamic> response) {
  Get.defaultDialog(
    title: MyText.warning.tr,
    middleText: response["errorKey"].toString().tr,
  );
}
// /// خطأ عام (غير محدد)
// void handlewarning() {
//   Get.defaultDialog(
//     title: MyText.warning.tr,
//     middleText: MyText.messagewarningAlready.tr,
//   );
// }

// /// خطأ: لا يوجد اتصال بالإنترنت
// void showConnectionError() {
//   Get.defaultDialog(
//     title: MyText.warning.tr,
//     middleText: MyText.checkInternet.tr,
//   );
// }

// /// خطأ: مشكلة غير متوقعة (500 أو Timeout)
// void showUnexpectedError() {
//   Get.defaultDialog(
//     title: MyText.warning.tr,
//     middleText: MyText.unexpectedError.tr,
//   );
// }

// /// خطأ: serverfailure (السيرفر لا يستجيب)
// void showServerFailureError() {
//   Get.defaultDialog(
//     title: MyText.warning.tr,
//     middleText: MyText.unexpectedError.tr,
//   );
// }

// /// خطأ: failure (خطأ عام)
// void showGeneralFailureError() {
//   Get.defaultDialog(
//     title: MyText.warning.tr,
//     middleText: MyText.messagewarningAlready.tr,
//   );
// }

// bool handleStateRequest(StateRequest stateRequest) {
//   if (stateRequest == StateRequest.offlinefailure) {
//     showConnectionError();
//     return false;
//   }

//   if (stateRequest == StateRequest.serverfailure) {
//     showServerFailureError();
//     return false;
//   }

//   if (stateRequest == StateRequest.failure) {
//     showGeneralFailureError();
//     return false;
//   }

//   // success → نرجع true
//   return true;
// }
