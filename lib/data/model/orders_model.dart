import 'package:electronics_store/data/model/coupon_model.dart';

class OrdersModel {
  final int? ordersId;
  final int? ordersUsersID;
  final int? ordersAddressesID;
  final int? ordersType;
  final double? ordersPriceDelivery; // تم التغيير لـ double
  final double? ordersPrice; // تم التغيير لـ double
  final double? ordersTotalPrice; // تم التغيير لـ double
  final int? ordersCouponID;
  final int? ordersPaymentMethod;
  final int? ordersStatus;
  final String? createdAt;
  final String? updatedAt;
  final int? ordersCouponIDDiscount;
  final CouponModel? couponModel;

  OrdersModel({
    this.ordersId,
    this.ordersUsersID,
    this.ordersAddressesID,
    this.ordersType,
    this.ordersPriceDelivery,
    this.ordersPrice,
    this.ordersTotalPrice,
    this.ordersCouponID,
    this.ordersPaymentMethod,
    this.ordersStatus,
    this.createdAt,
    this.updatedAt,
    this.ordersCouponIDDiscount,
    this.couponModel,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      ordersId: json['orders_id'],
      ordersUsersID: json['orders_usersID'],
      ordersAddressesID: json['orders_addressesID'],
      ordersType: json['orders_type'],
      // حماية الأسعار باستخدام .toDouble()
      ordersPriceDelivery: json['orders_price_delivery']?.toDouble(),
      ordersPrice: json['orders_price']?.toDouble(),
      ordersTotalPrice: json['orders_total_price']?.toDouble(),
      ordersCouponID: json['orders_couponID'],
      ordersPaymentMethod: json['orders_payment_method'],
      ordersStatus: json['orders_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      ordersCouponIDDiscount: json['orders_couponID_discount'],
      couponModel: json['coupon'] != null
          ? CouponModel.fromJson(json['coupon'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders_id': ordersId,
      'orders_usersID': ordersUsersID,
      'orders_addressesID': ordersAddressesID,
      'orders_type': ordersType,
      'orders_price_delivery': ordersPriceDelivery,
      'orders_price': ordersPrice,
      'orders_total_price': ordersTotalPrice,
      'orders_couponID': ordersCouponID,
      'orders_payment_method': ordersPaymentMethod,
      'orders_status': ordersStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'orders_couponID_discount': ordersCouponIDDiscount,
      'coupon': couponModel?.toJson(),
    };
  }

  OrdersModel copyWith({
    int? ordersId,
    int? ordersUsersID,
    int? ordersAddressesID,
    int? ordersType,
    double? ordersPriceDelivery,
    double? ordersPrice,
    double? ordersTotalPrice,
    int? ordersCouponID,
    int? ordersPaymentMethod,
    int? ordersStatus,
    String? createdAt,
    String? updatedAt,
    int? ordersCouponIDDiscount,
    CouponModel? couponModel,
  }) {
    return OrdersModel(
      ordersId: ordersId ?? this.ordersId,
      ordersUsersID: ordersUsersID ?? this.ordersUsersID,
      ordersAddressesID: ordersAddressesID ?? this.ordersAddressesID,
      ordersType: ordersType ?? this.ordersType,
      ordersPriceDelivery: ordersPriceDelivery ?? this.ordersPriceDelivery,
      ordersPrice: ordersPrice ?? this.ordersPrice,
      ordersTotalPrice: ordersTotalPrice ?? this.ordersTotalPrice,
      ordersCouponID: ordersCouponID ?? this.ordersCouponID,
      ordersPaymentMethod: ordersPaymentMethod ?? this.ordersPaymentMethod,
      ordersStatus: ordersStatus ?? this.ordersStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      ordersCouponIDDiscount:
          ordersCouponIDDiscount ?? this.ordersCouponIDDiscount,
      couponModel: couponModel ?? this.couponModel,
    );
  }
}
