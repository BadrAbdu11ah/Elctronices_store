import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddlewares extends GetMiddleware {
  @override
  int? get priority => 1;

  MyService myService = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myService.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: MyPages.homeScreen);
    }
    if (myService.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: MyPages.login);
    }
    return null;
  }
}
