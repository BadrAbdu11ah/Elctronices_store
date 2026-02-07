import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/data/datasource/remote/home_data.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  void goToItemsDetails(ItemsModel itemsModel);
  void checkSearch(String val);
  void onSearchItems();
  Future searchData();
}

class SearchControllerImp extends SearchController {
  late TextEditingController product;

  StateRequest stateRequest = StateRequest.none;

  HomeData homeData = HomeData(Get.find());

  List<ItemsModel> listSearchData = [];
  bool isSearch = false;

  @override
  void goToItemsDetails(itemsModel) {
    Get.toNamed(MyPages.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  Future searchData() async {
    stateRequest = StateRequest.loading;
    update();
    var response = await homeData.searchData(product.text);
    stateRequest = handlingData(response);
    if (stateRequest != StateRequest.success) {
      update();
      return;
    }
    if (response['status'] == "failure") {
      update();
      stateRequest = StateRequest.failure;
      return;
    }
    listSearchData.clear();
    List data = response['data'];
    listSearchData.addAll(data.map((e) => ItemsModel.fromJson(e)));
    update();
  }

  @override
  void checkSearch(val) {
    if (val.isEmpty) {
      stateRequest = StateRequest.none;
      isSearch = false;
      update();
    }
  }

  @override
  void onSearchItems() {
    if (product.text.isNotEmpty) {
      searchData();
      isSearch = true;
      update();
    }
  }
}
