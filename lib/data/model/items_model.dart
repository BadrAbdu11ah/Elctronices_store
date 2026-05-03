class ItemsModel {
  final int? itemsId;
  final String? itemsName;
  final String? itemsNameAr;
  final String? itemsDesc;
  final String? itemsDescAr;
  final String? itemsImage;
  final int? itemsCount;
  final int? itemsActive;
  final double? itemsPrice; // تم التغيير لـ double للأمان المالي
  final int? itemsDiscount;
  final int? itemsCategoriesID;
  final double? discountedPrice; // السعر بعد الخصم
  final String? favorite; // الحقل الذي يأتي من الـ Join في قاعدة البيانات
  final String? createdAt;
  final String? updatedAt;
  final Category? category;

  ItemsModel({
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsCategoriesID,
    this.discountedPrice,
    this.favorite,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDesc: json['items_desc'],
      itemsDescAr: json['items_desc_ar'],
      itemsImage: json['items_image'],
      itemsCount: json['items_count'],
      itemsActive: json['items_active'],
      // معالجة السعر والخصم كـ double لتجنب الـ Crash
      itemsPrice: json['items_price']?.toDouble(),
      itemsDiscount: json['items_discount'],
      itemsCategoriesID: json['items_categoriesID'],
      discountedPrice: json['discounted_price']?.toDouble(),
      favorite: json['favorite']
          ?.toString(), // قد يأتي كـ int أو String من Laravel
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      category: json['category'] != null
          ? Category.fromJson(json['category'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items_id': itemsId,
      'items_name': itemsName,
      'items_name_ar': itemsNameAr,
      'items_desc': itemsDesc,
      'items_desc_ar': itemsDescAr,
      'items_image': itemsImage,
      'items_count': itemsCount,
      'items_active': itemsActive,
      'items_price': itemsPrice,
      'items_discount': itemsDiscount,
      'items_categoriesID': itemsCategoriesID,
      'discounted_price': discountedPrice,
      'favorite': favorite,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'category': category?.toJson(),
    };
  }

  ItemsModel copyWith({
    int? itemsId,
    String? itemsName,
    String? itemsNameAr,
    String? itemsDesc,
    String? itemsDescAr,
    String? itemsImage,
    int? itemsCount,
    int? itemsActive,
    double? itemsPrice,
    int? itemsDiscount,
    int? itemsCategoriesID,
    double? discountedPrice,
    String? favorite,
    String? createdAt,
    String? updatedAt,
    Category? category,
  }) {
    return ItemsModel(
      itemsId: itemsId ?? this.itemsId,
      itemsName: itemsName ?? this.itemsName,
      itemsNameAr: itemsNameAr ?? this.itemsNameAr,
      itemsDesc: itemsDesc ?? this.itemsDesc,
      itemsDescAr: itemsDescAr ?? this.itemsDescAr,
      itemsImage: itemsImage ?? this.itemsImage,
      itemsCount: itemsCount ?? this.itemsCount,
      itemsActive: itemsActive ?? this.itemsActive,
      itemsPrice: itemsPrice ?? this.itemsPrice,
      itemsDiscount: itemsDiscount ?? this.itemsDiscount,
      itemsCategoriesID: itemsCategoriesID ?? this.itemsCategoriesID,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      favorite: favorite ?? this.favorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
    );
  }
}

class Category {
  final int? categoriesId;
  final String? categoriesName;
  final String? categoriesNameAr;
  final String? categoriesDescription;
  final String? categoriesImage;
  final String? createdAt;
  final String? updatedAt;

  Category({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesDescription,
    this.categoriesImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
      categoriesNameAr: json['categories_name_ar'],
      categoriesDescription: json['categories_description'],
      categoriesImage: json['categories_image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_name_ar': categoriesNameAr,
      'categories_description': categoriesDescription,
      'categories_image': categoriesImage,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
