import 'package:electronics_store/controller/favorite/favorite_controller.dart';
import 'package:electronics_store/controller/home/home_page_controller.dart';
import 'package:electronics_store/controller/search_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchControllerImp {
  void changeCategory(int val);
  void getData(int categoryId);
  void goToFavoritepage();
  void goToOrdersPanding();
}

class ItemsControllerImp extends ItemsController {
  MyService myService = Get.find();

  FavoriteControllerImp favorite = Get.find();

  String? lang;

  HomePageControllerImp screen = Get.find();

  List get categories => screen.categories;

  List items = [];

  late int categoryId;

  ItemsData itemsData = ItemsData(Get.find());

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
