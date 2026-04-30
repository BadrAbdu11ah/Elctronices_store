import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';

class FavoritePageData {
  final ApiService api;

  FavoritePageData(this.api);

  // 1. عرض كافة المنتجات في صفحة المفضلة
  Future viewFavorite() async {
    var response = await api.get(ApiEndpoints.favoriteView);
    return response.fold((l) => l, (r) => r);
  }

  // 2. حذف منتج من المفضلة (داخل صفحة المفضلة)
  Future removeData(int itemId) async {
    var response = await api.delete(ApiEndpoints.favoriteRemove(itemId));
    return response.fold((l) => l, (r) => r);
  }
}
