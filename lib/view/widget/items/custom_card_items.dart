import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_store/controller/favorite/favorite_controller.dart';
import 'package:electronics_store/controller/items/items_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/constant/my_image_asset.dart';
import 'package:electronics_store/core/function/translate_database.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomCardItems(this.itemsModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // مربع بخاصية التحريك
                  AnimatedContainer(
                    margin: EdgeInsets.only(right: 5), // 5 إلى اليمين
                    duration: Duration(milliseconds: 900), // زمن التحريك
                    height: 130,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Hero(
                      tag: "${itemsModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl: itemsModel.itemsImage!,
                        fit: BoxFit.contain,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    translateDatabase(
                      itemsModel.itemsName,
                      itemsModel.itemsNameAr,
                    ),
                    style: TextStyle(
                      fontSize: controller.lang == "ar" ? 15 : 16,
                      color: MyColor.titleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        MyText.rating.tr,
                        style: TextStyle(
                          fontSize: controller.lang == "ar" ? 12 : 15,
                          color: MyColor.bodyColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Icon(Icons.star, size: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemsModel.itemsDiscount! > 0
                          ? Row(
                              children: [
                                Text(
                                  "${itemsModel.itemsPrice} \$",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: MyColor.priceColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "${itemsModel.discountedPrice} \$",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: MyColor.priceColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              "${itemsModel.itemsPrice} \$",
                              style: TextStyle(
                                fontSize: 18,
                                color: MyColor.priceColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      GetBuilder<FavoriteControllerImp>(
                        builder: (controller) {
                          return IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  "1") {
                                controller.removeFavorite(
                                  itemsModel.itemsId.toString(),
                                );
                                controller.setFavorite(
                                  itemsModel.itemsId!,
                                  "0",
                                );
                              } else {
                                controller.addFavorite(
                                  itemsModel.itemsId.toString(),
                                );
                                controller.setFavorite(
                                  itemsModel.itemsId!,
                                  "1",
                                );
                              }
                            },
                            icon:
                                controller.isFavorite[itemsModel.itemsId] == "1"
                                ? Icon(
                                    Icons.favorite,
                                    color: MyColor.themeBlackColor,
                                  )
                                : Icon(
                                    Icons.favorite_outline,
                                    color: MyColor.themeBlackColor,
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (itemsModel.itemsDiscount! > 0)
              Image.asset(MyImageAsset.sale, width: 50),
          ],
        ),
      ),
    );
  }
}
