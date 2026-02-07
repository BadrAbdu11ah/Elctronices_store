import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  void logout();
  void goToAddressView();
}

class SettingsControllerImp extends SettingsController {
  MyService myService = Get.find();
  bool notification = true;
  late List<Map<String, dynamic>> options;

  @override
  void onInit() {
    options = [
      {
        "title": MyText.disableNotification.tr,
        "icon": Switch(value: notification, onChanged: (bool val) {}),
        "onTap": () {},
      },
      {
        "title": MyText.address.tr,
        "icon": Icon(Icons.location_on_outlined),
        "onTap": () {
          goToAddressView();
        },
      },
      {
        "title": MyText.aboutUs.tr,
        "icon": Icon(Icons.info_outlined),
        "onTap": () {},
      },
      {
        "title": MyText.contactUs.tr,
        "icon": Icon(Icons.phone_callback_outlined),
        "onTap": () {},
      },
      {
        "title": MyText.logout.tr,
        "icon": Icon(Icons.logout_outlined),
        "onTap": () {
          logout();
        },
      },
    ];

    super.onInit();
  }

  @override
  void logout() {
    myService.sharedPreferences.setString("step", "1");
    Get.offAllNamed(MyPages.login);
  }

  @override
  void goToAddressView() {
    Get.toNamed(MyPages.addressView);
  }
}
