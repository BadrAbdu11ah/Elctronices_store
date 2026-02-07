import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/address_data.dart';
import 'package:electronics_store/data/datasource/remote/checkout_data.dart';
import 'package:electronics_store/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class CheckOutController extends GetxController {
  void getAddressData();
  void choosePymentMethod(String val);
  void chooseDeliveryType(String val);
  void chooseShippingAddress(String val);
  void checkout();
}

class CheckOutControllerImp extends CheckOutController {
  StateRequest stateRequest = StateRequest.none;
  MyService myService = Get.find();

  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());

  String? paymentMethod;
  String? deliveryType;
  String? addressID;
  late String couponsID;
  late String priceOrders;

  List<AddressModel> addressModel = [];

  @override
  void onInit() {
    super.onInit();
    couponsID = Get.arguments['couponsid'] ?? "0";
    priceOrders = Get.arguments['priceorders'].toString();
    getAddressData();
  }

  @override
  void choosePymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  @override
  void chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  void chooseShippingAddress(String val) {
    addressID = val;
    update();
  }

  @override
  void getAddressData() async {
    stateRequest = StateRequest.loading;
    update();
    var response = await addressData.getData(
      myService.sharedPreferences.getString("id")!,
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
    print("====================== response controller: $response");
    List data = response['data'];
    addressModel.addAll(data.map((e) => AddressModel.fromJson(e)));
    update();
  }

  @override
  void checkout() async {
    if (paymentMethod == null) {
      Get.snackbar("Erorr", "Select Payment Method");
      return;
    }
    if (deliveryType == null) {
      Get.snackbar("Erorr", "Select Delivery Type");
      return;
    }
    if (deliveryType == "0" && addressID == null) {
      Get.snackbar("Erorr", "Select Shipping Address");
      return;
    }

    Map<String, dynamic> data = {
      'usersid': myService.sharedPreferences.getString("id"), // 1
      'addressesid': addressID ?? "0", // 0
      'type': deliveryType, // 1
      'pricedelivery': "20", // 20
      'price': priceOrders, // 7000
      'couponsid': couponsID, // 0
      'paymentmethod': paymentMethod, // 0
    };
    stateRequest = StateRequest.loading;
    update();
    var response = await checkoutData.getData(data);
    print("====================== response controller: $response");
    stateRequest = handlingData(response);
    print("============ stateRequest: $stateRequest");
    if (stateRequest != StateRequest.success) {
      stateRequest = StateRequest.none;
      Get.snackbar("Erorr", "erorr in server try again");
      update();
      return;
    }
    if (response['message'] == "coupon") {
      stateRequest = StateRequest.none;
      Get.snackbar("Erorr", "The coupon is not valid, try again");
      Get.offAllNamed(MyPages.homeScreen);
      update();
      return;
    }
    if (response['status'] != "success") {
      stateRequest = StateRequest.none;
      Get.snackbar("Erorr", "try again");
      update();
      return;
    }
    Get.snackbar("Alert", "The order was completed successfully");

    Get.offAllNamed(MyPages.homeScreen);
    update();
  }
}
