import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/orders/data/orders_data.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:electronics_store/data/model/orders_model.dart';
import 'package:get/get.dart';

abstract class OrdersPendingController extends GetxController {
  // Dependencies
  OrdersData ordersData = OrdersData(Get.find());
  MyService myService = Get.find();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Data Lists
  List<OrdersModel> ordersModel = [];

  // Helper Methods (Formatting & Display)
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

  // Core Methods
  void getOrders();
  void goToOrdersDetails(OrdersModel ordersModel);
}

// ربط طبقة البيانات بالمتحكم
class OrdersPendingControllerImp extends OrdersPendingController {
  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  @override
  void getOrders() async {
    ordersModel.clear();
    stateRequest = StateRequest.loading;
    update();

    var response = await ordersData.getPendingOrders();

    response.fold(
      (failure) {
        stateRequest = StateRequest.failure;
        update();
      },
      (orders) {
        ordersModel = orders;
        stateRequest = StateRequest.success;
        update();
      },
    );
  }

  // دالة مساعدة لعرض السعر بالريال السعودي والدولار معاً
  String formatPrice(double price) {
    double sarPrice = price * 3.75;
    return "$price \$ (${sarPrice.toStringAsFixed(2)} ر.س)";
  }

  @override
  void goToOrdersDetails(ordersModel) {
    Get.toNamed(MyPages.ordersDetails, arguments: {"ordersmodel": ordersModel});
  }
}
