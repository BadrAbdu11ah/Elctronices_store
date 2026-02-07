import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/address_data.dart';
import 'package:electronics_store/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class AddressViewController extends GetxController {
  void goToAddressAdd();
  void getData();
  void deleteAddress(int addressid);
  void editAddress();
}

class AddressViewControllerImp extends AddressViewController {
  AddressData addressData = AddressData(Get.find());
  MyService myService = Get.find();

  List<AddressModel> addresses = [];

  StateRequest stateRequest = StateRequest.none;

  @override
  void deleteAddress(addressid) {
    addressData.removeData(addressid.toString());
    addresses.removeWhere((e) => e.addressesId == addressid);
    update();
  }

  @override
  void editAddress() {
    Get.toNamed(MyPages.addressEdit);
  }

  @override
  void getData() async {
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
    List data = response['data'];
    addresses.addAll(data.map((e) => AddressModel.fromJson(e)));
    update();
  }

  @override
  void goToAddressAdd() {
    Get.toNamed(MyPages.addressAdd);
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
