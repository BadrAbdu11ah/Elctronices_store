import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';

class CheckoutData {
  final ApiService api;

  CheckoutData(this.api);

  // إرسال بيانات الطلب لإنشاء طلب جديد
  Future checkout(Map<String, dynamic> data) async {
    var response = await api.post(ApiEndpoints.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
