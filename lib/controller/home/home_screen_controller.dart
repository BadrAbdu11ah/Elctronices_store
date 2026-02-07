import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/home_data.dart';
import 'package:electronics_store/view/screen/home/home_page.dart';
import 'package:electronics_store/view/screen/home/settings_page.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  Future getData();
  void changePage(int i);
  void gotoCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  MyService myService = Get.find();

  String? lang;

  int currentPage = 0;

  bool isSelected = false;

  List<Widget> get listPage => [
    const HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("This is Favorite Page"))],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("This is Profile Page"))],
    ),
    const SettingsPage(),
  ];

  List<String> titleBottomEn = ["Home", "Favorite", "Profile", "Settings"];
  List<String> titleBottomAr = ["الرئيسي", "المفضلة", "صفحتي", "إعدادات"];

  List<IconData> iconNotActive = [
    Icons.home_outlined,
    Icons.star_border_outlined,
    Icons.person_2_outlined,
    Icons.settings_outlined,
  ];
  List<IconData> iconActive = [
    Icons.home,
    Icons.star,
    Icons.person_2,
    Icons.settings,
  ];

  StateRequest stateRequest = StateRequest.none;

  HomeData homeData = HomeData(Get.find());

  List categories = [];
  List items = [];

  @override
  void onInit() {
    getData();
    lang = myService.sharedPreferences.getString('lang');
    super.onInit();
  }

  @override
  Future getData() async {
    stateRequest = StateRequest.loading;
    update();
    var response = await homeData.getData();
    stateRequest = handlingData(response);
    if (stateRequest != StateRequest.success) {
      update();
      return;
    }
    categories.addAll(response['categories']);
    items = response['items'] ?? [];
    update();
  }

  @override
  void changePage(i) {
    currentPage = i;

    update();
  }

  @override
  void gotoCart() {
    Get.toNamed(MyPages.cart);
  }
}
