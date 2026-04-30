import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';

// (صفحة عرض المنتجات)
class ItemsData {
  final ApiService api;

  ItemsData(this.api);

  // جلب منتجات قسم معين
  Future getData(int categoryId) async {
    var response = await api.get(ApiEndpoints.itemsByCategory(categoryId));
    return response.fold((l) => l, (r) => r);
  }
}
