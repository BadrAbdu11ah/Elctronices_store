import 'package:electronics_store/controller/search_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/favorite_page_data.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoritePageController extends SearchControllerImp {
  void getData();
  void removeFavorite(String itemsid);
  void goToFavoriteDetails(String itemsid);
  void goToOrdersPanding();
}

class FavoritePageControllerImp extends FavoritePageController {
  MyService myService = Get.find();
  FavoritePageData favoriteData = FavoritePageData(Get.find());

  String? lang;

  List responseData = [];
  List<ItemsModel> items = [];

  @override
  void onInit() {
    product = TextEditingController();
    lang = myService.sharedPreferences.getString("lang");
    getData();
    super.onInit();
  }

  @override
  void getData() async {
    items.clear();
    stateRequest = StateRequest.loading;
    update();
    var response = await favoriteData.viewFavorite(
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
    responseData = response['data'];
    items.addAll(responseData.map((e) => ItemsModel.fromJson(e['item'])));
    update();
  }

  @override
  void goToFavoriteDetails(String itemsid) {
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsmodel": itemsid});
  }

  @override
  void removeFavorite(itemsid) {
    favoriteData.removeFavorite(
      myService.sharedPreferences.getString("id")!,
      itemsid.toString(),
    );
    items.removeWhere((element) => element.itemsId.toString() == itemsid);
    Get.rawSnackbar(title: "تنبيه", message: "تم حذف المنتج من المفضلة");
    update();
  }

  @override
  void goToOrdersPanding() {
    Get.toNamed(MyPages.ordersPending);
  }
}
