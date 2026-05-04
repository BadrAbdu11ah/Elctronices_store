import 'package:electronics_store/features/home/controller/search_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/favorite/data/favorite_data.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoritePageController extends SearchControllerImp {
  // Dependencies
  MyService myService = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());

  // Localization
  String? lang;

  // Data Lists
  List<ItemsModel> items = [];

  // Methods
  void getFavoriteProducts();
  void removeFavorite(String itemsid);
  void goToFavoriteDetails(String itemsid);
  void goToOrdersPanding();
}

class FavoritePageControllerImp extends FavoritePageController {
  @override
  void onInit() {
    product = TextEditingController();
    lang = myService.sharedPreferences.getString("lang");
    getFavoriteProducts();
    super.onInit();
  }

  @override
  Future<void> getFavoriteProducts() async {
    stateRequest = StateRequest.loading;
    update();

    var response = await favoriteData.viewFavorite();

    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (favoriteItems) {
        stateRequest = StateRequest.success;
        items.clear();
        items.addAll(favoriteItems);
        update();
      },
    );
  }

  @override
  void removeFavorite(String itemsid) async {
    // 1. حذف محلي سريع لتحسين تجربة المستخدم (Optimistic UI)
    items.removeWhere((element) => element.itemsId.toString() == itemsid);
    update();
    Get.rawSnackbar(title: "تنبيه", message: "تم حذف المنتج من المفضلة");

    // 2. إرسال الطلب للسيرفر
    var response = await favoriteData.removeFavorite(int.parse(itemsid));

    // 3. في حالة الفشل إعادة جلب البيانات
    response.fold((failure) => getFavoriteProducts(), (success) => null);
  }

  @override
  void goToFavoriteDetails(itemsid) {
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsid": itemsid});
  }

  @override
  void goToOrdersPanding() {
    Get.toNamed(MyPages.ordersPending);
  }
}
