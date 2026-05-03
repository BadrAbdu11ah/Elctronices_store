import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/model/address_model.dart';
import 'package:electronics_store/features/address/controller/view_controller.dart';
import 'package:electronics_store/features/address/data/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressEditController extends GetxController {
  // Dependencies
  MyService myService = Get.find();
  AddressData addressData = AddressData(Get.find());

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Form Properties
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController phone;
  late String lat;
  late String long;

  // Data Models
  late AddressModel addressModel;

  // Methods
  void initialData();
  void editData();
}

class AddressEditControllerImp extends AddressEditController {
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void initialData() {
    addressModel = Get.arguments['addressModel'] as AddressModel;
    name = TextEditingController(text: addressModel.addressesName);
    city = TextEditingController(text: addressModel.addressesCity);
    street = TextEditingController(text: addressModel.addressesStreet);
    phone = TextEditingController(text: addressModel.addressesPhone);
    lat = addressModel.addressesLat.toString();
    long = addressModel.addressesLong.toString();
    update();
  }

  @override
  Future<void> editData() async {
    // if (formstate.currentState?.validate() != true) return;

    stateRequest = StateRequest.loading;
    update();

    // تجهيز البيانات الجديدة
    Map<String, dynamic> updatedData = {
      "name": name.text,
      "city": city.text,
      "street": street.text,
      "lat": lat.toString(),
      "long": long.toString(),
      "phone": phone.text,
    };

    var response = await addressData.editAddress(
      addressModel.addressesId!,
      updatedData,
    );

    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) {
        if (data['status'] == "failure") {
          stateRequest = StateRequest.failure;
          update();
          return;
        }

        // الوصول لصفحة العرض
        AddressViewControllerImp viewCtrl = Get.find();

        // البحث عن العنوان المعدل في القائمة وتحديثه فوراً
        int index = viewCtrl.addresses.indexWhere(
          (e) => e.addressesId == addressModel.addressesId,
        );

        if (index != -1) {
          viewCtrl.addresses[index] = viewCtrl.addresses[index].copyWith(
            addressesName: name.text,
            addressesCity: city.text,
            addressesStreet: street.text,
            addressesPhone: phone.text,
          );

          viewCtrl.update();
        }

        Get.back();
      },
    );
  }

  @override
  void dispose() {
    name.dispose();
    city.dispose();
    street.dispose();
    phone.dispose();
    super.dispose();
  }
}
