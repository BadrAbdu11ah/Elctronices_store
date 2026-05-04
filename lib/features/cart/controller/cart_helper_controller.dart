import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/model/coupon_model.dart';
import 'package:electronics_store/features/cart/data/cart_data.dart';
import 'package:electronics_store/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartHelperController extends GetxController {
  // Dependencies
  final MyService myService = Get.find();
  final CartData cartData = CartData(Get.find());

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Localization
  String? lang;

  // Form Properties
  late TextEditingController coupon;
  late TextEditingController product;

  // Data Lists
  final List<CartModel> items = [];
  final List<int> countItem = [];
  final List<double> totalItemPrice = [];
  final List<bool> isUpdating = [];

  // Cart Calculations
  late CouponModel couponModel;
  String? couponsName;
  String? couponsid;
  int countAll = 0;
  double subtotalPrice = 0.0; // السعر قبل الشحن والخصم
  double originalPrice = 0.0; // السعر الخام قبل أي تعديل
  int discount = 0;
  double shipping = 20.0;
  double totalAppPrice = 0.0; // السعر النهائي بعد الخصم والشحن

  // Methods
  void resetCart();
  void recalculateTotals();
  void applyLocalChange(int index, int delta);
  void applyCoupon();
}

class CartHelperControllerImp extends CartHelperController {
  @override
  void resetCart() {
    items.clear();
    countItem.clear();
    totalItemPrice.clear();
    isUpdating.clear();
    countAll = 0;
    subtotalPrice = 0.0;
    totalAppPrice = 0.0;
    originalPrice = 0.0;
  }

  @override
  void recalculateTotals() {
    // 1. حساب السعر بعد خصم الكوبون (إن وجد)
    double priceAfterDiscount =
        subtotalPrice - (subtotalPrice * (discount / 100));

    // 2. إضافة تكلفة الشحن
    totalAppPrice = priceAfterDiscount + shipping;

    // تأكد من عدم نزول السعر تحت الصفر في حالات الحذف السريع
    if (totalAppPrice < 0) totalAppPrice = 0;
  }

  @override
  void applyLocalChange(int index, int delta) {
    // تحديث عداد المنتج الفردي
    countItem[index] += delta;
    // تحديث إجمالي عدد قطع السلة
    countAll += delta;

    // الحصول على سعر الوحدة لمنتج معين
    final double unitPrice =
        double.tryParse(items[index].itemPrice.toString()) ?? 0.0;

    // تحديث إجمالي سعر هذا المنتج في القائمة
    totalItemPrice[index] += (unitPrice * delta);

    // تحديث السعر الإجمالي للسلة (Subtotal)
    subtotalPrice += (unitPrice * delta);
    originalPrice += (unitPrice * delta);

    // إعادة حساب الضرائب/الشحن/الخصم
    recalculateTotals();
  }

  @override
  void applyCoupon() {
    recalculateTotals();
  }
}
