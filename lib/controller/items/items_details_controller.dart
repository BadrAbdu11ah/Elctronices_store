import 'package:electronics_store/controller/cart/cart_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/cart_data.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  void selectedColor(int id);
  void getData();
  void addCart();
  void removeCart();
  void goToCart();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  CartControllerImp cartControllerImp = Get.find();
  MyService myService = Get.find();
  StateRequest stateRequest = StateRequest.loading;

  List<String> color = [];

  CartData cartData = CartData(Get.find());

  List subItems = [
    {"id": "1", "name": "red", "active": false},
    {"id": "2", "name": "black", "active": false},
    {"id": "3", "name": "grey", "active": false},
  ];

  late ItemsModel itemsModel;
  int count = 0;
  @override
  void onInit() {
    itemsModel = Get.arguments["itemsmodel"];
    getData();
    super.onInit();
  }

  @override
  void getData() async {
    stateRequest = StateRequest.loading;
    update();
    var response = await cartData.countCart(
      myService.sharedPreferences.getString("id")!,
      itemsModel.itemsId.toString(),
    );
    stateRequest = handlingData(response);
    if (stateRequest != StateRequest.success) {
      update();
      return;
    }
    if (response['status'] != "success") {
      update();
      return;
    }

    count = response['count'] ?? 0;
    update();
  }

  @override
  void selectedColor(index) {
    color.add(subItems[index]['name']);
    subItems[index]['active'] = true;
    update();
  }

  @override
  void addCart() {
    cartControllerImp.add(itemsModel.itemsId.toString());
    count++;
    update();
  }

  @override
  void removeCart() {
    if (count > 0) {
      count--;
      cartControllerImp.remove(itemsModel.itemsId.toString());
      update();
    }
  }

  @override
  void goToCart() {
    Get.offNamed(MyPages.cart);
  }
}
