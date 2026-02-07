import 'package:electronics_store/controller/home/home_page_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/translate_database.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomePageControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        itemBuilder: (context, i) {
          return ItemsHomeModel(
            itemsModel: ItemsModel.fromJson(controller.items[i]),
          );
        },
      ),
    );
  }
}

class ItemsHomeModel extends GetView<HomePageControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHomeModel({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image.network(
              "${itemsModel.itemsImage}",
              height: 90,
              width: 150,
              // fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 110,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            top: 8,
            left: controller.lang == "en" ? 25 : null,
            right: controller.lang == "ar" ? 25 : null,
            child: Text(
              "${translateDatabase(itemsModel.itemsName, itemsModel.itemsNameAr)}",
              style: TextStyle(
                color: MyColor.themeWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: controller.lang == "ar" ? 14 : 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
