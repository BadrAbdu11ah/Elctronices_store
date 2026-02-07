class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  int? itemsCategoriesID;
  int? discountedPrice;
  String? createdAt;
  String? updatedAt;
  Category? category;

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
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCategoriesID = json['items_categoriesID'];
    discountedPrice = json['discounted_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_categoriesID'] = this.itemsCategoriesID;
    data['discounted_price'] = this.discountedPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesDescription;
  String? categoriesImage;
  String? createdAt;
  String? updatedAt;

  Category({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesDescription,
    this.categoriesImage,
    this.createdAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesDescription = json['categories_description'];
    categoriesImage = json['categories_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_description'] = this.categoriesDescription;
    data['categories_image'] = this.categoriesImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// {
//   "status": "success",
//   "data": [
//     {
//       "items_id": 3,
//       "items_name": "iphone 17 pro",
//       "items_name_ar": "أيفون 17 برو",
//       "items_desc": "This mobile is very powerful, comes in several colors, and is used in various fields.",
//       "items_desc_ar": "هذا الجوال قوي جدا يأتي بعدة ألوان يستخدم في عدة مجالات",
//       "items_image": "http://my_api_project.test/upload/items/iphone_no_bg-removebg.png",
//       "items_count": 5,
//       "items_active": 1,
//       "items_price": 4000,
//       "items_discount": 0,
//       "items_categoriesID": 1,
//       "created_at": null,
//       "updated_at": null,
//       "favorite": "1",
//       "discounted_price": 4000
//     }
//   ]
// }
