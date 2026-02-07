import 'package:electronics_store/controller/cart/cart_page_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/core/function/translate_database.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/cart/custom_bottom_cart.dart';
import 'package:electronics_store/view/widget/cart/custom_card_cart.dart';
import 'package:electronics_store/view/widget/cart/top_count_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends GetView<CartPageControllerImp> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyText.cartPageTitle.tr)),
      bottomNavigationBar: GetBuilder<CartPageControllerImp>(
        builder: (controller) {
          return CustomBottomCart(
            price: "${controller.originalPrice} \$",
            discount: controller.price != 0.0
                ? "${controller.discount}%"
                : "${0}",
            shipping: controller.price != 0.0
                ? "${controller.shipping} \$"
                : "${0.0} \$",
            totalPrice: controller.price != 0.0
                ? "${controller.totalPrice} \$"
                : "${0.0} \$",
            couponController: controller.coupon,
            onCoupon: () {
              controller.checkCoupon(controller.coupon.text);
            },
            onOrder: () {
              controller.goToCheckOut();
            },
          );
        },
      ),
      body: GetBuilder<CartPageControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            state: controller.stateRequest,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ListView(
                children: [
                  TopCountItemCart(
                    message: MyText.cartItemsCount.tr.replaceAll(
                      "@count",
                      controller.countAll.toString(),
                    ),
                  ),
                  Column(
                    children: [
                      if (controller.items.isNotEmpty)
                        ...List.generate(controller.items.length, (int index) {
                          return CustomCardCart(
                            imageName:
                                controller.items[index].itemsModel!.itemsImage!,
                            itemsName: translateDatabase(
                              controller.items[index].itemsModel!.itemsName!,
                              controller.items[index].itemsModel!.itemsNameAr!,
                            ),
                            price: controller.totalItemPrice[index],
                            onAdd: () {
                              controller.addCount(
                                index,
                                controller.items[index].itemsModel!.itemsId
                                    .toString(),
                              );
                            },
                            count: controller.countItem[index],
                            onRemove: () {
                              controller.removeCount(
                                index,
                                controller.items[index].itemsModel!.itemsId
                                    .toString(),
                              );
                            },
                            onCard: () {
                              controller.goToItemsDetails(
                                controller.items[index].itemsModel!,
                              );
                            },
                          );
                        }),
                    ],
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
