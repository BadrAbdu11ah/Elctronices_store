class CouponModel {
  final int? couponsId;
  final String? couponsName;
  final int? couponsCount;
  final String? couponsExpiredate;
  final int? couponsDiscount;
  final String? createdAt;
  final String? updatedAt;

  CouponModel({
    this.couponsId,
    this.couponsName,
    this.couponsCount,
    this.couponsExpiredate,
    this.couponsDiscount,
    this.createdAt,
    this.updatedAt,
  });

  // تحويل البيانات من JSON بأسلوب الـ Factory
  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      couponsId: json['coupons_id'],
      couponsName: json['coupons_name'],
      couponsCount: json['coupons_count'],
      couponsExpiredate: json['coupons_expiredate'],
      couponsDiscount: json['coupons_discount'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coupons_id': couponsId,
      'coupons_name': couponsName,
      'coupons_count': couponsCount,
      'coupons_expiredate': couponsExpiredate,
      'coupons_discount': couponsDiscount,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  CouponModel copyWith({
    int? couponsId,
    String? couponsName,
    int? couponsCount,
    String? couponsExpiredate,
    int? couponsDiscount,
    String? createdAt,
    String? updatedAt,
  }) {
    return CouponModel(
      couponsId: couponsId ?? this.couponsId,
      couponsName: couponsName ?? this.couponsName,
      couponsCount: couponsCount ?? this.couponsCount,
      couponsExpiredate: couponsExpiredate ?? this.couponsExpiredate,
      couponsDiscount: couponsDiscount ?? this.couponsDiscount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
