import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/model/categories_model.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:electronics_store/features/home/data/home_data.dart';
import 'package:electronics_store/features/home/view/home_page.dart';
import 'package:electronics_store/features/home/view/settings_page.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  // Dependencies
  MyService myService = Get.find();
  HomeData homeData = HomeData(Get.find());

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Localization & Navigation State
  String? lang;
  int currentPage = 0;
  bool isSelected = false;

  // UI Pages & Content
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

  // Navigation Assets
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

  // Data Lists
  List categories = [];
  List items = [];

  // Methods
  Future getData();
  void changePage(int i);
  void gotoCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  @override
  void onInit() {
    getData();
    lang = myService.sharedPreferences.getString('lang');
    super.onInit();
  }

  @override
  Future<void> getData() async {
    // 1. تحديث الحالة إلى "جاري التحميل"
    stateRequest = StateRequest.loading;
    update();

    // 2. طلب البيانات من ملف الـ Data
    var response = await homeData.getData();

    // 3. فحص الرد باستخدام fold
    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) {
        stateRequest = StateRequest.success;

        categories.clear();
        categories.addAll(data['categories'] as List<CategoriesModel>);

        items.clear();
        items.addAll(data['items'] as List<ItemsModel>);

        update();
      },
    );
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
