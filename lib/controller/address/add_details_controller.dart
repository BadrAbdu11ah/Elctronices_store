import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressAddDetailsController extends GetxController {
  void initialData();
  void addData();
}

class AddressAddDetailsControllerImp extends AddressAddDetailsController {
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController phone;
  late String lat;
  late String long;

  MyService myService = Get.find();
  AddressData addressData = AddressData(Get.find());
  List data = [];
  StateRequest stateRequest = StateRequest.none;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    city.dispose();
    street.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  void initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    phone = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    update();
  }

  @override
  void addData() async {
    stateRequest = StateRequest.loading;
    update();
    var response = await addressData.addData(
      myService.sharedPreferences.getString('id')!,
      name.text,
      city.text,
      street.text,
      lat,
      long,
      phone.text,
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

    Get.offAllNamed(MyPages.homeScreen);
    update();
  }
}
