import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';

class CartData {
  final ApiService api;

  CartData(this.api);

  // 1. إضافة منتج للسلة
  Future addCart(int itemId) async {
    var response = await api.post(ApiEndpoints.cartAdd(itemId), {});
    return response.fold((l) => l, (r) => r);
  }

  // 2. حذف منتج من السلة
  Future removeCart(int itemId) async {
    var response = await api.delete(ApiEndpoints.cartRemove(itemId));
    return response.fold((l) => l, (r) => r);
  }

  // 3. جلب عدد القطع لمنتج معين في السلة
  Future getCount(int itemId) async {
    var response = await api.get(ApiEndpoints.cartCount(itemId));
    return response.fold((l) => l, (r) => r);
  }
}
