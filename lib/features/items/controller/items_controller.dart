import 'package:electronics_store/data/model/items_model.dart';
import 'package:electronics_store/features/favorite/data/favorite_data.dart';
import 'package:electronics_store/features/home/controller/home_page_controller.dart';
import 'package:electronics_store/features/home/controller/search_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/items/data/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchControllerImp {
  // Dependencies
  MyService myService = Get.find();
  HomePageControllerImp screen = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  FavoriteData favoriteData = FavoriteData(Get.find());

  // Localization
  String? lang;

  // Data Getters & Properties
  List get categories => screen.categories;
  List<ItemsModel> items = [];
  late int categoryId;

  // Data Collections
  Map isFavorite = {};

  // Methods
  void changeCategory(int val);
  void getItems(int categoryId);

  void setFavorite(int id, dynamic val);
  void addFavorite(int itemsid);
  void removeFavorite(int itemsid);
  void goToFavoritepage();

  void goToOrdersPanding();
}

class ItemsControllerImp extends ItemsController {
  @override
  void onInit() {
    categoryId = Get.arguments['categoryId'];
    getItems(categoryId);
    product = TextEditingController();
    lang = myService.sharedPreferences.getString("lang");
    super.onInit();
  }

  @override
  void getItems(categoryId) async {
    items.clear();
    stateRequest = StateRequest.loading;
    update();

    var response = await itemsData.getItems(int.parse(categoryId.toString()));

    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (itemsList) {
        stateRequest = StateRequest.success;
        items.addAll(itemsList);

        // ---  ملء حالة المفضلة تلقائياً ---
        for (var item in itemsList) {
          isFavorite[item.itemsId] = item.favorite;
        }
        // -------------------------------------------

        update();
      },
    );
  }

  @override
  void setFavorite(int id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  void addFavorite(int itemsid) async {
    // 1. تحديث محلي فوري (Optimistic UI)
    setFavorite(itemsid, 1);

    // 2. طلب الإضافة من السيرفر
    var response = await favoriteData.addFavorite(itemsid);

    // 3. معالجة الرد
    response.fold(
      (failure) {
        // في حال الفشل نرجع الحالة كما كانت
        setFavorite(itemsid, 0);
        Get.rawSnackbar(title: "خطأ", message: "تعذر إضافة المنتج للمفضلة");
      },
      (success) {
        Get.rawSnackbar(title: "تنبيه", message: "تم إضافة المنتج إلى المفضلة");
      },
    );
  }

  @override
  void removeFavorite(int itemsid) async {
    // 1. تحديث محلي فوري
    setFavorite(itemsid, 0);

    // 2. طلب الحذف من السيرفر
    var response = await favoriteData.removeFavorite(itemsid);

    // 3. معالجة الرد
    response.fold(
      (failure) {
        // في حال الفشل نرجع الحالة كما كانت (موجود في المفضلة)
        setFavorite(itemsid, 1);
        Get.rawSnackbar(title: "خطأ", message: "تعذر حذف المنتج من المفضلة");
      },
      (success) {
        Get.rawSnackbar(title: "تنبيه", message: "تم حذف المنتج من المفضلة");
      },
    );
  }

  @override
  void changeCategory(int val) {
    categoryId = val;
    getItems(categoryId);
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
