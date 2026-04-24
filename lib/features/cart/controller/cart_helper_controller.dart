import 'package:electronics_store/features/cart/controller/cart_controller.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/cart/data/cart_page_data.dart';
import 'package:electronics_store/data/model/cart_model.dart';
import 'package:electronics_store/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartHelperController extends GetxController {
  // Dependencies
  final MyService myService = Get.find();
  final CartPageData cartData = CartPageData(Get.find());
  final CartControllerImp cartController = Get.find();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Localization & Models
  String? lang;
  late final CouponModel couponModel;

  // Form Properties
  late TextEditingController coupon;
  late TextEditingController product;

  // Data Lists
  final List<CartModel> items = [];
  final List<int> countItem = [];
  final List<int> totalItemPrice = [];
  final List<bool> isUpdating = [];

  // Cart Calculations
  String? couponsName;
  String? couponsid;
  int countAll = 0;
  double price = 0.0;
  double originalPrice = 0.0;
  int discount = 0;
  double shipping = 20;
  double totalPrice = 0.0;

  // Methods
  void resetCart();
  void recalculateTotals();
  void applyLocalChange(int index, int delta);
  void applyCoupon();
}

class CartHelperControllerImp extends CartHelperController {
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
