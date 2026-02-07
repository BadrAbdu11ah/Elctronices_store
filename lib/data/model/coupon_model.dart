class CouponModel {
  int? couponsId;
  String? couponsName;
  int? couponsCount;
  String? couponsExpiredate;
  int? couponsDiscount;
  String? createdAt;
  String? updatedAt;

  CouponModel({
    this.couponsId,
    this.couponsName,
    this.couponsCount,
    this.couponsExpiredate,
    this.couponsDiscount,
    this.createdAt,
    this.updatedAt,
  });

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponsId = json['coupons_id'];
    couponsName = json['coupons_name'];
    couponsCount = json['coupons_count'];
    couponsExpiredate = json['coupons_expiredate'];
    couponsDiscount = json['coupons_discount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupons_id'] = this.couponsId;
    data['coupons_name'] = this.couponsName;
    data['coupons_count'] = this.couponsCount;
    data['coupons_expiredate'] = this.couponsExpiredate;
    data['coupons_discount'] = this.couponsDiscount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


// {
//   "status": "success",
//   "data": {
//     "coupons_id": 2,
//     "coupons_name": "badr",
//     "coupons_count": 10,
//     "coupons_expiredate": "2026-02-10 15:42:59",
//     "coupons_discount": 20,
//     "created_at": null,
//     "updated_at": null
//   }
// }