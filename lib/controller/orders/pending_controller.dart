import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/orders_pending_data.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/data/model/orders_model.dart';
import 'package:get/get.dart';

abstract class OrdersPendingController extends GetxController {
  void getOrders();
  void goToOrdersDetails(OrdersModel ordersModel);
}

class OrdersPendingControllerImp extends OrdersPendingController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  StateRequest stateRequest = StateRequest.none;
  MyService myService = Get.find();
  List<OrdersModel> ordersModel = [];

  String printPaymentMethod(String val) {
    if (val == "0") return MyText.ordersPaymentCash;
    return MyText.paymentCards;
  }

  String printDeliveryType(String val) {
    if (val == "0") return MyText.ordersDelivery;
    return MyText.ordersDriveThru;
  }

  String printOrderStatus(String val) {
    if (val == "0") return MyText.ordersWaiting;
    if (val == "1") return MyText.ordersPreparing;
    return MyText.ordersArchived;
  }

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  @override
  void getOrders() async {
    ordersModel.clear();
    stateRequest = StateRequest.loading;
    update();
    var response = await ordersPendingData.getData(
      myService.sharedPreferences.getString("id")!,
    );
    stateRequest = handlingData(response);
    if (stateRequest != StateRequest.success) {
      update();
      return;
    }
    if (response['status'] != "success") {
      stateRequest = StateRequest.failure;
      update();
      return;
    }

    List data = response['data'];
    ordersModel.addAll(data.map((e) => OrdersModel.fromJson(e)));

    update();
  }

  @override
  void goToOrdersDetails(ordersModel) {
    Get.toNamed(MyPages.ordersDetails, arguments: {"ordersmodel": ordersModel});
  }
}
