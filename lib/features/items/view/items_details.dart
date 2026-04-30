import 'package:electronics_store/features/items/controller/items_details_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/core/function/translate_database.dart';
import 'package:electronics_store/data/datasurce/static/my_text.dart';
import 'package:electronics_store/features/items/widgets/items_datails/custom_bottom_item.dart';
import 'package:electronics_store/features/items/widgets/items_datails/custom_title_dec_color.dart';
import 'package:electronics_store/features/items/widgets/items_datails/items_details_image.dart';
import 'package:electronics_store/features/items/widgets/items_datails/price_and_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<ItemsDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          state: controller.stateRequest,
          child: CustomBottomItem(
            titleAdd: MyText.textButtonAddInCart.tr,
            onAdd: () {
              controller.addCart();
            },
            titleGoToCart: MyText.textGoToCartPage.tr,
            onGoToCart: () {
              controller.goToCart();
            },
          ),
        ),
      ),
      body: GetBuilder<ItemsDetailsControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            state: controller.stateRequest,
            child: Container(
              padding: EdgeInsets.all(15),
              child: ListView(
                children: [
                  ItemsDetailsImage(
                    tagHero: "${controller.itemsModel.itemsId}",
                    imageLink: "${controller.itemsModel.itemsImage}",
                  ),
                  PriceAndCount(
                    onAdd: () {
                      controller.addCart();
                    },
                    onRemove: () {
                      controller.removeCart();
                    },
                    count: '${controller.count}',
                    price: '${controller.itemsModel.itemsPrice}',
                    discountedPrice: '${controller.itemsModel.discountedPrice}',
                    discount: controller.itemsModel.itemsDiscount ?? 0,
                  ),
                  CustomTitleDecColor(
                    title: translateDatabase(
                      controller.itemsModel.itemsName,
                      controller.itemsModel.itemsNameAr,
                    ),
                    dec:
                        "${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
