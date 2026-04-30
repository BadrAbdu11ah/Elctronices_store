import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';

class HomeData {
  final ApiService api;

  HomeData(this.api);

  // 1. جلب بيانات الصفحة الرئيسية (أقسام، عروض، منتجات)
  Future getData() async {
    var response = await api.get(ApiEndpoints.home);
    return response.fold((l) => l, (r) => r);
  }

  // 2. البحث عن المنتجات
  Future searchData(String search) async {
    var response = await api.post(ApiEndpoints.search, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
