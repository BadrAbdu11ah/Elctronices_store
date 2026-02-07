import 'package:electronics_store/controller/items/items_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/translate_database.dart';
import 'package:electronics_store/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80, // مهم جدًا
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoriesCard(
            indexCategory: index + 1,
            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class CategoriesCard extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int indexCategory;
  const CategoriesCard({
    super.key,
    required this.categoriesModel,
    required this.indexCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCategory(indexCategory);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                decoration: controller.categoryId == indexCategory
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: MyColor.themeColor!,
                            width: 3,
                          ),
                        ),
                      )
                    : null,
                child: Text(
                  translateDatabase(
                    categoriesModel.categoriesName,
                    categoriesModel.categoriesNameAr,
                  ),
                  style: TextStyle(fontSize: 20),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
