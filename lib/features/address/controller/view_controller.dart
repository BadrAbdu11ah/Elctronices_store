import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
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
  void goToEditAddress(AddressModel address);
  void goToAddressAdd();
}

class AddressViewControllerImp extends AddressViewController {
  @override
  void onInit() {
    getAddresses();
    super.onInit();
  }

  @override
  void getAddresses() async {
    stateRequest = StateRequest.loading;
    update();

    var response = await addressData.getAddresses();

    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) {
        stateRequest = StateRequest.success;
        addresses.clear();
        addresses.addAll(data);
        update();
      },
    );
  }

  @override
  void deleteAddress(int addressid) async {
    // نبحث عن العنصر ونحفظه مؤقتاً في حال فشل الحذف لنعيده
    int indexToRemove = addresses.indexWhere((e) => e.addressesId == addressid);
    var removedAddress = addresses[indexToRemove];

    addresses.removeAt(indexToRemove);
    update();

    // طلب الحذف من السيرفر
    var response = await addressData.removeAddress(addressid);

    response.fold(
      (failure) {
        // إعادة العنصر المحذوف إلى القائمة
        addresses.insert(indexToRemove, removedAddress);
        stateRequest = failure;
        update();
      },
      (data) {
        if (data['status'] == "failure") {
          // إعادة العنصر المحذوف إلى القائمة
          addresses.insert(indexToRemove, removedAddress);
          Get.defaultDialog(
            title: "تنبيه",
            middleText: data['message'] ?? "حدث خطأ غير متوقع",
          );
          update();
          return;
        }

        // نجاح الحذف
        Get.snackbar(
          "نجاح",
          "تم حذف العنوان بنجاح",
          snackPosition: SnackPosition.BOTTOM,
        );

        if (addresses.isEmpty) {
          stateRequest = StateRequest.noData;
        }
        update();
      },
    );
  }

  @override
  void goToEditAddress(address) {
    Get.toNamed(MyPages.addressEdit, arguments: {"addressModel": address});
  }

  @override
  void goToAddressAdd() {
    Get.toNamed(MyPages.addressAdd);
  }
}
