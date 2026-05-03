import 'package:electronics_store/data/model/items_model.dart';

class CartModel {
  final ItemsModel? itemsModel;
  final int? countItems;
  final double? itemPrice;
  final double? totalItemPrice;

  CartModel({
    this.itemsModel,
    this.countItems,
    this.itemPrice,
    this.totalItemPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      itemsModel: json['item'] != null
          ? ItemsModel.fromJson(json['item'])
          : null,
      countItems: json['count_items'],
      // التأكد من تحويل الأسعار لـ double بشكل آمن
      itemPrice: json['item_price']?.toDouble(),
      totalItemPrice: json['total_item_price']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item': itemsModel?.toJson(),
      'count_items': countItems,
      'item_price': itemPrice,
      'total_item_price': totalItemPrice,
    };
  }

  CartModel copyWith({
    ItemsModel? itemsModel,
    int? countItems,
    double? itemPrice,
    double? totalItemPrice,
  }) {
    return CartModel(
      itemsModel: itemsModel ?? this.itemsModel,
      countItems: countItems ?? this.countItems,
      itemPrice: itemPrice ?? this.itemPrice,
      totalItemPrice: totalItemPrice ?? this.totalItemPrice,
    );
  }
}
