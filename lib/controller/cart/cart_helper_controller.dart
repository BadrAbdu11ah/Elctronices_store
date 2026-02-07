import 'package:electronics_store/controller/cart/cart_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/cart_page_data.dart';
import 'package:electronics_store/data/model/cart_model.dart';
import 'package:electronics_store/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartHelperController extends GetxController {
  void resetCart();
  void recalculateTotals();
  void applyLocalChange(int index, int delta);
  void applyCoupon();
}

class CartHelperControllerImp extends CartHelperController {
  late TextEditingController coupon;
  final MyService myService = Get.find();
  final CartPageData cartData = CartPageData(Get.find());
  final CartControllerImp cartController = Get.find();
  String? lang;

  late TextEditingController product;

  final List<CartModel> items = [];
  late final CouponModel couponModel;
  final List<int> countItem = [];
  final List<int> totalItemPrice = [];
  final List<bool> isUpdating = [];

  String? couponsName;
  String? couponsid;
  int countAll = 0; // العدد الإجمالي لكل المنتجات
  double price = 0.0; // السعر الإجمالي بدون الشحن
  double originalPrice = 0.0;
  int discount = 0; // تكلفة الشحن الثابتة
  double shipping = 20; // تكلفة الشحن الثابتة
  double totalPrice = 0.0; // السعر النهائي (منتجات + شحن)

  StateRequest stateRequest = StateRequest.none;

  @override
  void resetCart() {
    items.clear(); // مسح المنتجات
    countItem.clear(); // مسح أعداد المنتجات
    totalItemPrice.clear(); // مسح أسعار المنتجات
    isUpdating.clear(); // مسح أقفال التحديث
    countAll = 0; // تصفير العدد الإجمالي
    price = 0.0; // تصفير السعر
    totalPrice = 0.0; // تصفير السعر النهائي
  }

  @override
  void recalculateTotals() {
    totalPrice = price + shipping;
  }

  @override
  void applyLocalChange(index, delta) {
    countItem[index] += delta;
    countAll += delta;

    final itemPrice = items[index].itemPrice ?? 0;
    price += itemPrice * delta;
    originalPrice += itemPrice * delta;
    totalItemPrice[index] += itemPrice * delta;

    recalculateTotals();
  }

  @override
  void applyCoupon() {
    price = price - (price * (discount / 100));
    recalculateTotals();
  }
}
