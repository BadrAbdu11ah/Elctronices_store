import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';

// (الطلبات المعلقة)
class OrdersPendingData {
  final ApiService api;

  OrdersPendingData(this.api);

  // جلب الطلبات القائمة (المعلقة) للمستخدم الحالي
  Future getData() async {
    var response = await api.get(ApiEndpoints.pending);
    return response.fold((l) => l, (r) => r);
  }

  // تفاصيل طلب معين (يمكن استخدامها في صفحة تفاصيل الطلب)
  Future getOrderDetails(int orderId) async {
    var response = await api.get(ApiEndpoints.orderDetails(orderId));
    return response.fold((l) => l, (r) => r);
  }
}
