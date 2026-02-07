import 'package:electronics_store/controller/home/home_page_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/translate_database.dart';
import 'package:electronics_store/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100, // مهم جدًا
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoriesHomeModel(
            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class CategoriesHomeModel extends GetView<HomePageControllerImp> {
  final CategoriesModel categoriesModel;
  const CategoriesHomeModel({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          AnimatedContainer(
            padding: EdgeInsets.all(8),
            duration: Duration(milliseconds: 900), // زمن التحريك
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: MyColor.themeColor, // اللون
              borderRadius: BorderRadius.circular(20), // الاستدارة
            ),
            child: SvgPicture.network(
              "${categoriesModel.categoriesImage}",
              colorFilter: ColorFilter.mode(
                MyColor.themeBlackColor!,
                BlendMode.srcIn,
              ),
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image),
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriesName, categoriesModel.categoriesNameAr)}",
          ),
        ],
      ),
    );
  }
}
