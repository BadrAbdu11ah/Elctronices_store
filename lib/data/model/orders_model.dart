import 'package:electronics_store/data/model/coupon_model.dart';

class OrdersModel {
  int? ordersId;
  int? ordersUsersID;
  int? ordersAddressesID;
  int? ordersType;
  int? ordersPriceDelivery;
  int? ordersPrice;
  int? ordersTotalPrice;
  int? ordersCouponID;
  int? ordersPaymentMethod;
  int? ordersStatus;
  String? createdAt;
  String? updatedAt;
  int? ordersCouponIDDiscount;
  CouponModel? couponModel;

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

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersID = json['orders_usersID'];
    ordersAddressesID = json['orders_addressesID'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_total_price'];
    ordersCouponID = json['orders_couponID'];
    ordersPaymentMethod = json['orders_payment_method'];
    ordersStatus = json['orders_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ordersCouponIDDiscount = json['orders_couponID_discount'];
    couponModel = json['coupon'] != null
        ? new CouponModel.fromJson(json['coupon'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersID'] = this.ordersUsersID;
    data['orders_addressesID'] = this.ordersAddressesID;
    data['orders_type'] = this.ordersType;
    data['orders_price_delivery'] = this.ordersPriceDelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_total_price'] = this.ordersTotalPrice;
    data['orders_couponID'] = this.ordersCouponID;
    data['orders_payment_method'] = this.ordersPaymentMethod;
    data['orders_status'] = this.ordersStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['orders_couponID_discount'] = this.ordersCouponIDDiscount;
    if (this.couponModel != null) {
      data['coupon'] = this.couponModel!.toJson();
    }
    return data;
  }
}


// {
//   "status": "success",
//   "data": [
//     {
//       "orders_id": 1,
//       "orders_usersID": 1,
//       "orders_addressesID": null,
//       "orders_type": 1,
//       "orders_price_delivery": 0,
//       "orders_price": 4200,
//       "orders_total_price": 4200,
//       "orders_couponID": 0,
//       "orders_payment_method": 0,
//       "orders_status": 0,
//       "created_at": "2026-02-04T14:36:49.000000Z",
//       "updated_at": "2026-02-04T14:36:49.000000Z",
//       "orders_couponID_discount": 0,
//       "coupon": null
//     },
//     {
//       "orders_id": 2,
//       "orders_usersID": 1,
//       "orders_addressesID": 2,
//       "orders_type": 0,
//       "orders_price_delivery": 20,
//       "orders_price": 5700,
//       "orders_total_price": 5720,
//       "orders_couponID": 2,
//       "orders_payment_method": 1,
//       "orders_status": 0,
//       "created_at": "2026-02-04T14:37:45.000000Z",
//       "updated_at": "2026-02-04T14:37:45.000000Z",
//       "orders_couponID_discount": 20,
//       "coupon": {
//         "coupons_id": 2,
//         "coupons_name": "badr",
//         "coupons_count": 10,
//         "coupons_expiredate": "2026-02-10 15:42:59",
//         "coupons_discount": 20,
//         "created_at": null,
//         "updated_at": null
//       }
//     }
//   ]
// }