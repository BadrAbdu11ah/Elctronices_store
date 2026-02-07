import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/cart_data.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  Future<bool> add(String itemsid);
  Future<bool> remove(String itemsid);
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  MyService myService = Get.find();
  StateRequest stateRequest = StateRequest.none;

  @override
  Future<bool> add(itemsid) async {
    var response = await cartData.addCart(
      myService.sharedPreferences.getString("id")!,
      itemsid.toString(),
    );
    stateRequest = handlingData(response);
    if (stateRequest != StateRequest.success) {
      update();
      return false;
    }
    if (response['status'] != "success") {
      stateRequest = StateRequest.failure;
      update();
      return false;
    }
    return true;
  }

  @override
  Future<bool> remove(itemsid) async {
    print("========================= removeCard");
    var response = await cartData.removeCart(
      myService.sharedPreferences.getString("id")!,
      itemsid.toString(),
    );
    stateRequest = handlingData(response);
    if (stateRequest != StateRequest.success) {
      update();
      return false;
    }
    if (response['status'] == "noData") {
      update();
      return false;
    }
    return true;
  }
}
