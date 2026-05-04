import 'package:electronics_store/features/items/controller/items_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:electronics_store/data/model/items_model.dart';
import 'package:electronics_store/widgets/custom_app_bar.dart';
import 'package:electronics_store/features/home/widgets/list_items_search.dart';
import 'package:electronics_store/features/items/widgets/items/custom_card_items.dart';
import 'package:electronics_store/features/items/widgets/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends GetView<ItemsControllerImp> {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(10),
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
                  onFavorite: () {
                    controller.goToFavoritepage();
                  },
                ),
                if (!controller.isSearch) ListCategoriesItems(),
                HandlingDataView(
                  state: controller.stateRequest,
                  child: controller.isSearch
                      ? ListItemsSearch(
                          listDataModel: controller.listSearchData,
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                // عدد الأعمدة في الصف الواحد
                                crossAxisCount: 2,
                                // نسبة العرض إلى الارتفاع لكل عنصر
                                childAspectRatio: 0.7,
                              ),
                          itemCount: controller.items.length,
                          itemBuilder: (BuildContext context, int i) {
                            return CustomCardItems(controller.items[i]);
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
