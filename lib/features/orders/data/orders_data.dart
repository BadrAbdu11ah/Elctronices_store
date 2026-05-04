import 'package:dartz/dartz.dart';
import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/api_service.dart';
import 'package:electronics_store/data/model/orders_model.dart';

class OrdersData {
  final ApiService api;
  OrdersData(this.api);

  Future<Either<StateRequest, List<OrdersModel>>> getPendingOrders() async {
    var response = await api.get(ApiEndpoints.pending);
    return response.fold((failure) => Left(failure), (data) {
      List rawOrders = data['orders'] ?? [];
      List<OrdersModel> ordersList = rawOrders
          .map((e) => OrdersModel.fromJson(e))
          .toList();
      return Right(ordersList);
    });
  }

  // جلب تفاصيل الطلب (منتجات + عنوان + معلومات الطلب)
  Future<Either<StateRequest, Map<String, dynamic>>> getOrderDetails(
    int orderId,
  ) async {
    var response = await api.get("${ApiEndpoints.orderDetails}/$orderId");

    return response.fold((failure) => Left(failure), (data) {
      if (data['status'] == "failure") return Left(StateRequest.failure);

      return Right(data);
    });
  }
}
