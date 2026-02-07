import 'package:electronics_store/controller/favorite/favorite_page_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/custom_app_bar.dart';
import 'package:electronics_store/view/widget/favorite/custom_card_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends GetView<FavoritePageControllerImp> {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              title: MyText.findProduct.tr,
              product: controller.product,
              onOrder: () {
                controller.goToOrdersPanding();
              },
              onSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              isFavorite: false,
            ),
            GetBuilder<FavoritePageControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  state: controller.stateRequest,
                  child: GridView.builder(
                    // يجعل الـ الشبكة يأخذ حجمه حسب المحتوى وليس الشاشة كاملة
                    shrinkWrap: true,
                    // يمنع التمرير لأن التمرير يكون من الودجت الأب
                    physics: NeverScrollableScrollPhysics(),
                    // يحدد طريقة توزيع العناصر داخل الشبكة
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // عدد الأعمدة في الصف الواحد
                      crossAxisCount: 2,
                      // نسبة العرض إلى الارتفاع لكل عنصر
                      childAspectRatio: 0.7,
                    ),
                    itemCount: controller.items.length,
                    itemBuilder: (BuildContext context, int i) {
                      return CustomCardFavorite(
                        itemsModel: controller.items[i],
                        onCard: () {
                          controller.goToFavoriteDetails(
                            controller.items[i].itemsId.toString(),
                          );
                        },
                        onFavorite: () {
                          controller.removeFavorite(
                            controller.items[i].itemsId.toString(),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
