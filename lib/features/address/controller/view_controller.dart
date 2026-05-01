import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/address/data/address_data.dart';
import 'package:electronics_store/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class AddressViewController extends GetxController {
  // Dependencies
  AddressData addressData = AddressData(Get.find());
  MyService myService = Get.find();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Data Lists
  List<AddressModel> addresses = [];

  // Methods
  void getAddresses();
  void deleteAddress(int addressid);
  void goToEditAddress();
  void goToAddressAdd();
}

class AddressViewControllerImp extends AddressViewController {
  @override
  void onInit() {
    super.onInit();
    getAddresses();
  }

  @override
  void getAddresses() async {
    stateRequest = StateRequest.loading;
    update();
    var response = await addressData.getAddresses();
    stateRequest = handlingData(response);
    if (stateRequest != StateRequest.success) {
      update();
      return;
    }
    if (response['status'] != "success") {
      update();
      return;
    }
    List data = response['data'];
    addresses.addAll(data.map((e) => AddressModel.fromJson(e)));
    update();
  }

  @override
  void deleteAddress(addressid) {
    addressData.removeData(addressid.toString());
    addresses.removeWhere((e) => e.addressesId == addressid);
    update();
  }

  @override
  void goToEditAddress() {
    Get.toNamed(MyPages.addressEdit);
  }

  @override
  void goToAddressAdd() {
    Get.toNamed(MyPages.addressAdd);
  }
}
