import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/cart/data/cart_data.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  // Dependencies
  MyService myService = Get.find();
  CartData cartData = CartData(Get.find());

  // State Management
  StateRequest stateRequest = StateRequest.loading;

  // Item Details & Properties
  late ItemsModel itemsModel;
  int count = 0;
  List<String> color = [];
  bool isUpdating = false;

  // Selection Options
  List subItems = [
    {"id": "1", "name": "red", "active": false},
    {"id": "2", "name": "black", "active": false},
    {"id": "3", "name": "grey", "active": false},
  ];

  // Methods
  void selectedColor(int id);
  void getCountCart();
  Future<void> addCart();
  Future<void> removeCart();
  void goToCart();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  @override
  void onInit() {
    itemsModel = Get.arguments["itemsmodel"];
    getCountCart();
    super.onInit();
  }

  @override
  void getCountCart() async {
    // 1. تحديث الحالة إلى جاري التحميل
    stateRequest = StateRequest.loading;
    update();

    // 2. طلب البيانات من طبقة الـ Data
    var response = await cartData.getCountCart(itemsModel.itemsId!);

    // 3. فحص الرد باستخدام fold
    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (countResult) {
        stateRequest = StateRequest.success;
        count = countResult;
        update();
      },
    );
  }

  @override
  void selectedColor(index) {
    color.add(subItems[index]['name']);
    subItems[index]['active'] = true;
    update();
  }

  @override
  Future<void> addCart() async {
    if (isUpdating) return;
    isUpdating = true;
    count++;
    update();
    var response = await cartData.addCart(
      int.parse(itemsModel.itemsId.toString()),
    );

    response.fold(
      (failure) {
        count--;
        Get.rawSnackbar(title: "خطأ", message: "حدث خطأ أثناء إضافة المنتج");
        update();
        return;
      },
      (success) {
        if (!success) {
          count--;
          Get.rawSnackbar(
            title: "خطأ",
            message: "فشل في إضافة المنتج إلى السلة",
          );
          update();
          return;
        }
        Get.rawSnackbar(title: "نجاح", message: "تم إضافة المنتج إلى السلة");
        update();
      },
    );
    isUpdating = false;
  }

  @override
  Future<void> removeCart() async {
    if (isUpdating) return;
    isUpdating = true;
    if (count > 0) {
      count--;
      update();
      var response = await cartData.removeCart(
        int.parse(itemsModel.itemsId.toString()),
      );

      response.fold(
        (failure) {
          count++;
          Get.rawSnackbar(title: "خطأ", message: "حدث خطأ أثناء إضافة المنتج");
          update();
          return;
        },
        (success) {
          if (!success) {
            count++;
            Get.rawSnackbar(
              title: "خطأ",
              message: "فشل في إضافة المنتج إلى السلة",
            );
            update();
            return;
          }
          Get.rawSnackbar(title: "نجاح", message: "تم إزالة المنتج من السلة");
          update();
        },
      );
    }
    isUpdating = false;
  }

  @override
  void goToCart() {
    Get.offNamed(MyPages.cart);
  }
}
