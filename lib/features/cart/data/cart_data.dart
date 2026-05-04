import 'package:dartz/dartz.dart';
import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/api_service.dart';
import 'package:electronics_store/data/model/cart_model.dart';
import 'package:electronics_store/data/model/coupon_model.dart';

class CartData {
  final ApiService api;
  CartData(this.api);

  Future<Either<StateRequest, Map<String, dynamic>>> viewCart() async {
    var response = await api.get(ApiEndpoints.cartView);

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == "failure") return Left(StateRequest.failure);

      List rawData = data['data'] ?? [];
      List<CartModel> cartList = rawData
          .map((e) => CartModel.fromJson(e))
          .toList();

      double totalPrice = double.tryParse(data['totalprice'].toString()) ?? 0.0;
      int countAll = int.tryParse(data['countall'].toString()) ?? 0;

      return Right({
        "items": cartList,
        "totalprice": totalPrice,
        "countall": countAll,
      });
    });
  }

  Future<Either<StateRequest, CouponModel>> checkCoupon(
    String couponName,
  ) async {
    var response = await api.get(ApiEndpoints.checkCoupon(couponName));

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == "failure") {
        return Left(StateRequest.failure);
      }

      return Right(CouponModel.fromJson(data['data']));
    });
  }

  Future<Either<StateRequest, bool>> addCart(int itemId) async {
    var response = await api.post(ApiEndpoints.cartAdd(itemId), {});
    return response.fold((l) => Left(l), (r) {
      if (r['status'] == "success") return const Right(true);
      return Left(StateRequest.failure);
    });
  }

  Future<Either<StateRequest, bool>> removeCart(int itemId) async {
    var response = await api.delete(ApiEndpoints.cartRemove(itemId));
    return response.fold((l) => Left(l), (r) {
      if (r['status'] == "success") return const Right(true);
      return Left(StateRequest.failure);
    });
  }

  // جلب عدد العناصر لمنتج محدد وتفاصيله
  Future<Either<StateRequest, int>> getCountCart(int itemId) async {
    var response = await api.get(ApiEndpoints.cartCount(itemId));

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == "failure") {
        return Left(StateRequest.failure);
      }
      // استخراج العدد مباشرة وتحويله لـ int
      int count = int.tryParse(data['count'].toString()) ?? 0;
      return Right(count);
    });
  }
}
