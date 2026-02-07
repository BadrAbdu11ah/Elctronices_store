import 'package:electronics_store/core/class/state_request.dart';

/// دالة لفحص نوع الرد وتحديد حالة الطلب
StateRequest handlingData(dynamic response) {
  // إذا كان الرد يحمل حالة (مثل خطأ اتصال أو خادم)، يتم إرجاع الحالة نفسها
  if (response is StateRequest) {
    return response;
  }
  // في حال لم يكن الرد حالة خطأ، فهذا يعني وصول بيانات بنجاح
  return StateRequest.success;
}
