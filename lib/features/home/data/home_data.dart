import 'package:dartz/dartz.dart';
import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/api_service.dart';
import 'package:electronics_store/data/model/categories_model.dart';
import 'package:electronics_store/data/model/items_model.dart';

class HomeData {
  final ApiService api;
  HomeData(this.api);

  // جلب بيانات الصفحة الرئيسية
  Future<Either<StateRequest, Map<String, List>>> getData() async {
    var response = await api.get(ApiEndpoints.home);

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == "failure") {
        return Left(StateRequest.failure);
      }

      List rawCategories = data['categories'] ?? [];
      List<CategoriesModel> categoriesList = rawCategories
          .map((e) => CategoriesModel.fromJson(e))
          .toList();

      List rawItems = data['items'] ?? [];
      List<ItemsModel> itemsList = rawItems
          .map((e) => ItemsModel.fromJson(e))
          .toList();

      return Right({"categories": categoriesList, "items": itemsList});
    });
  }

  // البحث عن المنتجات
  Future<Either<StateRequest, List<ItemsModel>>> searchData(
    String search,
  ) async {
    var response = await api.post(ApiEndpoints.search, {"search": search});
    return response.fold((l) => Left(l), (r) {
      if (r['status'] == "failure") return Left(StateRequest.failure);
      List data = r['data'];
      return Right(data.map((e) => ItemsModel.fromJson(e)).toList());
    });
  }
}
