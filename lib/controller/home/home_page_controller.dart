import 'package:electronics_store/controller/home/home_screen_controller.dart';
import 'package:electronics_store/controller/search_controller.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends SearchControllerImp {
  void goToItems(int i);
  void signOut();
  void goToFavoritepage();
  void goToOrdersPanding();
}

class HomePageControllerImp extends HomePageController {
  MyService myService = Get.find();
  HomeScreenControllerImp screen = Get.find();

  List get categories => screen.categories;
  List get items => screen.items;
  String? lang;

  @override
  void onInit() {
    product = TextEditingController();
    lang = myService.sharedPreferences.getString("lang");
    super.onInit();
  }

  @override
  void goToItems(categoryId) {
    Get.toNamed(MyPages.items, arguments: {'categoryId': categoryId});
  }

  @override
  void signOut() {
    myService.sharedPreferences.setString("step", "1");
    Get.offAllNamed(MyPages.login);
  }

  @override
  void goToFavoritepage() {
    Get.toNamed(MyPages.favorite);
  }

  @override
  void goToOrdersPanding() {
    Get.toNamed(MyPages.ordersPending);
  }
}
