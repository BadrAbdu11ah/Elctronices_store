import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_store/controller/favorite/favorite_page_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/translate_database.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardFavorite extends GetView<FavoritePageControllerImp> {
  final ItemsModel itemsModel;
  final void Function() onCard;
  final void Function() onFavorite;
  const CustomCardFavorite({
    super.key,
    required this.itemsModel,
    required this.onCard,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCard,
      child: Card(
        child: Padding(
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
                translateDatabase(itemsModel.itemsName, itemsModel.itemsNameAr),
                style: TextStyle(
                  fontSize: controller.lang == "ar" ? 15 : 16,
                  color: MyColor.titleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                  IconButton(
                    onPressed: onFavorite,
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: MyColor.themeBlackColor,
                    ),
                  ),
                  Text(
                    "${itemsModel.itemsPrice} \$",
                    style: TextStyle(
                      fontSize: 18,
                      color: MyColor.priceColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
