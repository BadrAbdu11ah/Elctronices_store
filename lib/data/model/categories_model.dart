class CategoriesModel {
  int? _categoriesId;
  String? _categoriesName;
  String? _categoriesNameAr;
  String? _categoriesDescription;
  String? _categoriesImage;
  String? _categoriesDatetime;

  CategoriesModel({
    int? categoriesId,
    String? categoriesName,
    String? categoriesNameAr,
    String? categoriesDescription,
    String? categoriesImage,
    String? categoriesDatetime,
  }) {
    if (categoriesId != null) {
      this._categoriesId = categoriesId;
    }
    if (categoriesName != null) {
      this._categoriesName = categoriesName;
    }
    if (categoriesNameAr != null) {
      this._categoriesNameAr = categoriesNameAr;
    }
    if (categoriesDescription != null) {
      this._categoriesDescription = categoriesDescription;
    }
    if (categoriesImage != null) {
      this._categoriesImage = categoriesImage;
    }
    if (categoriesDatetime != null) {
      this._categoriesDatetime = categoriesDatetime;
    }
  }

  int? get categoriesId => _categoriesId;
  set categoriesId(int? categoriesId) => _categoriesId = categoriesId;
  String? get categoriesName => _categoriesName;
  set categoriesName(String? categoriesName) =>
      _categoriesName = categoriesName;
  String? get categoriesNameAr => _categoriesNameAr;
  set categoriesNameAr(String? categoriesNameAr) =>
      _categoriesNameAr = categoriesNameAr;
  String? get categoriesDescription => _categoriesDescription;
  set categoriesDescription(String? categoriesDescription) =>
      _categoriesDescription = categoriesDescription;
  String? get categoriesImage => _categoriesImage;
  set categoriesImage(String? categoriesImage) =>
      _categoriesImage = categoriesImage;
  String? get categoriesDatetime => _categoriesDatetime;
  set categoriesDatetime(String? categoriesDatetime) =>
      _categoriesDatetime = categoriesDatetime;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    _categoriesId = json['categories_id'];
    _categoriesName = json['categories_name'];
    _categoriesNameAr = json['categories_name_ar'];
    _categoriesDescription = json['categories_description'];
    _categoriesImage = json['categories_image'];
    _categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this._categoriesId;
    data['categories_name'] = this._categoriesName;
    data['categories_name_ar'] = this._categoriesNameAr;
    data['categories_description'] = this._categoriesDescription;
    data['categories_image'] = this._categoriesImage;
    data['categories_datetime'] = this._categoriesDatetime;
    return data;
  }
}
