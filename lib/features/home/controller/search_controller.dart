import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/features/home/data/home_data.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  // Dependencies
  HomeData homeData = HomeData(Get.find());

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Form Properties
  late TextEditingController product;

  // Search State & Data
  List<ItemsModel> listSearchData = [];
  bool isSearch = false;

  // Methods
  void goToItemsDetails(ItemsModel itemsModel);
  void checkSearch(String val);
  void onSearchItems();
  Future searchData();
}

class SearchControllerImp extends SearchController {
  @override
  void onInit() {
    product = TextEditingController();
    super.onInit();
  }

  @override
  void goToItemsDetails(itemsModel) {
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  Future searchData() async {
    stateRequest = StateRequest.loading;
    update();

    var response = await homeData.searchData(product.text);

    response.fold(
      (failure) {
        stateRequest = failure;
      },
      (itemsList) {
        listSearchData.clear();
        if (itemsList.isEmpty) {
          stateRequest = StateRequest.failure;
        } else {
          stateRequest = StateRequest.success;
          listSearchData.addAll(itemsList);
        }
      },
    );
    update();
  }

  @override
  void checkSearch(val) {
    if (val.isEmpty) {
      stateRequest = StateRequest.none;
      isSearch = false;
      listSearchData.clear();
      update();
    }
  }

  @override
  void onSearchItems() {
    if (product.text.isNotEmpty) {
      isSearch = true;
      searchData();
    }
  }

  @override
  void dispose() {
    product.dispose();
    super.dispose();
  }
}
