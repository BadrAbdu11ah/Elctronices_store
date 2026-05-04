import 'package:dartz/dartz.dart';
import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/api_service.dart';
import 'package:electronics_store/data/model/items_model.dart';

class FavoriteData {
  final ApiService api;
  FavoriteData(this.api);

  // 1. جلب قائمة المفضلة
  Future<Either<StateRequest, List<ItemsModel>>> viewFavorite() async {
    var response = await api.get(ApiEndpoints.favoriteView);

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == "failure") return Left(StateRequest.failure);

      List rawData = data['data'] ?? [];
      // تحويل البيانات إلى قائمة من ItemsModel
      List<ItemsModel> favoriteList = rawData
          .map((e) => ItemsModel.fromJson(e['item']))
          .toList();

      return Right(favoriteList);
    });
  }

  // 2. إضافة منتج (إعادة حالة فقط)
  Future<Either<StateRequest, bool>> addFavorite(int itemId) async {
    var response = await api.post(ApiEndpoints.favoriteAdd(itemId), {});
    return response.fold((l) => Left(l), (r) {
      if (r['status'] == "success") return const Right(true);
      return Left(StateRequest.failure);
    });
  }

  // 3. حذف منتج (إعادة حالة فقط)
  Future<Either<StateRequest, bool>> removeFavorite(int itemId) async {
    var response = await api.delete(ApiEndpoints.favoriteRemove(itemId));
    return response.fold((l) => Left(l), (r) {
      if (r['status'] == "success") return const Right(true);
      return Left(StateRequest.failure);
    });
  }
}
