import 'package:electronics_store/features/favorite/controller/favorite_controller.dart';
import 'package:electronics_store/features/home/controller/home_page_controller.dart';
import 'package:electronics_store/features/home/controller/search_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/items/data/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchControllerImp {
  // Dependencies
  MyService myService = Get.find();
  FavoriteControllerImp favorite = Get.find();
  HomePageControllerImp screen = Get.find();
  ItemsData itemsData = ItemsData(Get.find());

  // Localization
  String? lang;

  // Data Getters & Properties
  List get categories => screen.categories;
  List items = [];
  late int categoryId;

  // Methods
  void changeCategory(int val);
  void getData(int categoryId);
  void goToFavoritepage();
  void goToOrdersPanding();
}

class ItemsControllerImp extends ItemsController {
  @override
  void onInit() {
    categoryId = Get.arguments['categoryId'];
    getData(categoryId);
    product = TextEditingController();
    lang = myService.sharedPreferences.getString("lang");
    super.onInit();
  }

  @override
  void getData(categoryId) async {
    items.clear();
    stateRequest = StateRequest.loading;
    update();
    var response = await itemsData.getData(
      categoryId.toString(),
      myService.sharedPreferences.getString("id")!,
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
    items = response['data'];
    update();
  }

  @override
  void changeCategory(int val) {
    categoryId = val;
    getData(categoryId);
    update();
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
