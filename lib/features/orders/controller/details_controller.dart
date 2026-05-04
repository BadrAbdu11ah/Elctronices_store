import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/orders/data/orders_data.dart';
import 'package:electronics_store/data/model/address_model.dart';
import 'package:electronics_store/data/model/cart_model.dart';
import 'package:electronics_store/data/model/orders_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

abstract class OrdersDetailsController extends GetxController {
  // Dependencies
  MyService myService = Get.find();
  OrdersData ordersData = OrdersData(Get.find());

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Localization
  String? lang;

  // Data Models & Lists
  late OrdersModel ordersModel;
  List<CartModel> cartItems = [];
  AddressModel? addressModel;

  // Location Properties
  Position? position;
  double? lat;
  double? long;

  // Methods
  void getCurrentPositionApp();
  void getOrdersDetails();
}

class OrdersDetailsControllerImp extends OrdersDetailsController {
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

    // طلب البيانات من السيرفر باستخدام رقم الطلب
    var response = await ordersData.getOrderDetails(ordersModel.ordersId!);

    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) {
        stateRequest = StateRequest.success;

        // 1. تنظيف القوائم السابقة
        cartItems.clear();

        // 2. تعبئة قائمة المنتجات (تحويل JSON إلى CartModel)
        List rawItems = data['data'] ?? [];
        cartItems.addAll(rawItems.map((e) => CartModel.fromJson(e)));

        // 3. تعبئة موديل العنوان إذا كان موجوداً
        if (data['address'] != null) {
          addressModel = AddressModel.fromJson(data['address']);
        }

        // 4. (إضافي) تحديث معلومات الطلب العامة إذا احتجت لها
        ordersModel = OrdersModel.fromJson(data['order_info']);

        update();
      },
    );
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
