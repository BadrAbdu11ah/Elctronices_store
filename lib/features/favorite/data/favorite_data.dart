import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';

class FavoriteData {
  final ApiService api;

  FavoriteData(this.api);

  // 1. إضافة منتج للمفضلة
  Future addFavorite(int itemId) async {
    var response = await api.post(ApiEndpoints.favoriteAdd(itemId), {});
    return response.fold((l) => l, (r) => r);
  }

  // 2. حذف منتج من المفضلة
  Future removeFavorite(int itemId) async {
    var response = await api.delete(ApiEndpoints.favoriteRemove(itemId));
    return response.fold((l) => l, (r) => r);
  }

  // 3. عرض كافة المنتجات المفضلة للمستخدم الحالي
  Future viewFavorite() async {
    var response = await api.get(ApiEndpoints.favoriteView);
    return response.fold((l) => l, (r) => r);
  }
}
