import 'package:electronics_store/data/model/items_model.dart';

class CartModel {
  ItemsModel? itemsModel;
  int? countItems;
  int? itemPrice;
  int? totalItemPrice;

  CartModel({
    this.itemsModel,
    this.countItems,
    this.itemPrice,
    this.totalItemPrice,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsModel = json['item'] != null
        ? ItemsModel.fromJson(json['item'])
        : null;
    countItems = json['count_items'];
    itemPrice = json['item_price'];
    totalItemPrice = json['total_item_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemsModel != null) {
      data['item'] = this.itemsModel!.toJson();
    }
    data['count_items'] = this.countItems;
    data['item_price'] = this.itemPrice;
    data['total_item_price'] = this.totalItemPrice;
    return data;
  }
}




// {
//   "status": "success",
//   "data": [
//     {
//       "item": {
//         "items_id": 2,
//         "items_name": "iphone 16 normal",
//         "items_name_ar": "ايفون 16 عادي",
//         "items_desc": "",
//         "items_desc_ar": "",
//         "items_image": "http://my_api_project.test/upload/items/iphone.png",
//         "items_count": 3,
//         "items_active": 1,
//         "items_price": 3000,
//         "items_discount": 10,
//         "items_categoriesID": 1,
//         "created_at": null,
//         "updated_at": null,
//         "discounted_price": 2700
//       },
//       "count_items": 1,
//       "item_price": 2700,
//       "total_item_price": 2700
//     },
//     {
//       "item": {
//         "items_id": 3,
//         "items_name": "laptop dell x ",
//         "items_name_ar": "لابتوب دل إكس",
//         "items_desc": "",
//         "items_desc_ar": "",
//         "items_image": "http://my_api_project.test/upload/items/laptop.png",
//         "items_count": 15,
//         "items_active": 1,
//         "items_price": 1500,
//         "items_discount": 0,
//         "items_categoriesID": 2,
//         "created_at": null,
//         "updated_at": null,
//         "discounted_price": 1500
//       },
//       "count_items": 2,
//       "item_price": 1500,
//       "total_item_price": 3000
//     }
//   ],
//   "totalprice": 5700,
//   "countall": 3
// }