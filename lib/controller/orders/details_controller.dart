import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/orders_details_data.dart';
import 'package:electronics_store/data/model/address_model.dart';
import 'package:electronics_store/data/model/cart_model.dart';
import 'package:electronics_store/data/model/orders_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

abstract class OrdersDetailsController extends GetxController {
  void getCurrentPositionApp();
  void getOrdersDetails();
}

class OrdersDetailsControllerImp extends OrdersDetailsController {
  StateRequest stateRequest = StateRequest.none;
  MyService myService = Get.find();

  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  late OrdersModel ordersModel;
  List<CartModel> items = [];
  AddressModel? addressModel;

  Position? position;

  String? lang;

  double? lat;
  double? long;

  @override
  void onInit() {
    super.onInit();
    lang = myService.sharedPreferences.getString('lang')!;
    ordersModel = Get.arguments['ordersmodel'];
    getOrdersDetails();
  }

  @override
  void getCurrentPositionApp() async {
    stateRequest = StateRequest.loading;
    update();

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      stateRequest = StateRequest.failure;
      Get.snackbar("تنبيه", 'الرجاء تشغيل إعدادات الموقع');
      update();
      return;
    }

    // فحص أذونات الوصول للموقع
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        stateRequest = StateRequest.failure;
        Get.snackbar('تنبيه', 'تم رفض الوصول للموقع');
        update();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      stateRequest = StateRequest.failure;
      Get.snackbar("تنبيه", 'صلاحيات الموقع مرفوضة بشكل دائم');
      update();
      return;
    }
    position = await Geolocator.getCurrentPosition();

    if (position == null) {
      stateRequest = StateRequest.failure;
    }

    stateRequest = StateRequest.success;
    update();
  }

  @override
  Future<void> getOrdersDetails() async {
    stateRequest = StateRequest.loading;
    update();

    var response = await ordersDetailsData.getData(
      myService.sharedPreferences.getString("id")!,
      ordersModel.ordersId.toString(),
      ordersModel.ordersAddressesID.toString(),
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
    final List data = response['data'] ?? [];

    items.addAll(data.map((e) => CartModel.fromJson(e)));

    addressModel = response['address'] != null
        ? AddressModel.fromJson(response['address'])
        : null;
    print("=========== AddressModel: ${addressModel}");
    update();
  }
}

// {
//   "status": "success",
//   "data": [
//     {
//       "item": {
//         "items_id": 2,
//         "items_name": "iphone 16 normal",
//         "items_name_ar": "ايفون 16 عادي",
//         "items_desc": "",
//         "items_desc_ar": "",
//         "items_image": "http://my_api_project.test/upload/items/iphone.png",
//         "items_count": 3,
//         "items_active": 1,
//         "items_price": 3000,
//         "items_discount": 10,
//         "items_categoriesID": 1,
//         "created_at": null,
//         "updated_at": null,
//         "discounted_price": 2700
//       },
//       "count_items": 1,
//       "item_price": 2700,
//       "total_item_price": 2700
//     },
//     {
//       "item": {
//         "items_id": 3,
//         "items_name": "laptop dell x ",
//         "items_name_ar": "لابتوب دل إكس",
//         "items_desc": "",
//         "items_desc_ar": "",
//         "items_image": "http://my_api_project.test/upload/items/laptop.png",
//         "items_count": 15,
//         "items_active": 1,
//         "items_price": 1500,
//         "items_discount": 0,
//         "items_categoriesID": 2,
//         "created_at": null,
//         "updated_at": null,
//         "discounted_price": 1500
//       },
//       "count_items": 2,
//       "item_price": 1500,
//       "total_item_price": 3000
//     }
//   ],
//   "totalprice": 5700,
//   "address": null,
//   "countall": 3
// }
