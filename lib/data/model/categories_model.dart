class CategoriesModel {
  final int? categoriesId;
  final String? categoriesName;
  final String? categoriesNameAr;
  final String? categoriesDescription;
  final String? categoriesImage;
  final String? categoriesDatetime;

  CategoriesModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesDescription,
    this.categoriesImage,
    this.categoriesDatetime,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
      categoriesNameAr: json['categories_name_ar'],
      categoriesDescription: json['categories_description'],
      categoriesImage: json['categories_image'],
      categoriesDatetime: json['categories_datetime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_name_ar': categoriesNameAr,
      'categories_description': categoriesDescription,
      'categories_image': categoriesImage,
      'categories_datetime': categoriesDatetime,
    };
  }

  CategoriesModel copyWith({
    int? categoriesId,
    String? categoriesName,
    String? categoriesNameAr,
    String? categoriesDescription,
    String? categoriesImage,
    String? categoriesDatetime,
  }) {
    return CategoriesModel(
      categoriesId: categoriesId ?? this.categoriesId,
      categoriesName: categoriesName ?? this.categoriesName,
      categoriesNameAr: categoriesNameAr ?? this.categoriesNameAr,
      categoriesDescription:
          categoriesDescription ?? this.categoriesDescription,
      categoriesImage: categoriesImage ?? this.categoriesImage,
      categoriesDatetime: categoriesDatetime ?? this.categoriesDatetime,
    );
  }
}
