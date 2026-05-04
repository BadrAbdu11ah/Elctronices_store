import 'package:electronics_store/features/orders/controller/details_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/translate_database.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardOrdersDetails extends GetView<OrdersDetailsControllerImp> {
  const CardOrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Table(
              children: [
                TableRow(
                  children: [
                    Text(
                      MyText.item.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: MyColor.themeBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      MyText.qty.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: MyColor.themeBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      MyText.price.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: MyColor.themeBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ...List.generate(controller.cartItems.length, (i) {
                  return TableRow(
                    children: [
                      Text(
                        translateDatabase(
                          controller.cartItems[i].itemsModel!.itemsName!,
                          controller.cartItems[i].itemsModel!.itemsNameAr!,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${controller.cartItems[i].countItems}",
                        textAlign: TextAlign.center,
                      ),
                      controller.lang == 'ar'
                          ? Text(
                              "\$ ${controller.cartItems[i].totalItemPrice}",
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              "${controller.cartItems[i].totalItemPrice} \$",
                              textAlign: TextAlign.center,
                            ),
                    ],
                  );
                }),
              ],
            ),
            Divider(),
            controller.lang == 'ar'
                ? Text(
                    "${MyText.orderPrice.tr}: \$ ${controller.ordersModel.ordersPrice}",
                  )
                : Text(
                    "${MyText.orderPrice.tr}: ${controller.ordersModel.ordersPrice} \$",
                  ),
            controller.lang == 'ar'
                ? Text(
                    "${MyText.deliveryPrice.tr}: "
                    "\$ ${controller.ordersModel.ordersPriceDelivery}",
                  )
                : Text(
                    "${MyText.deliveryPrice.tr}: "
                    "${controller.ordersModel.ordersPriceDelivery} \$",
                  ),

            controller.ordersModel.ordersCouponIDDiscount != 0
                ? controller.lang == 'ar'
                      ? Text(
                          "${MyText.coupon.tr}: "
                          "% ${controller.ordersModel.ordersCouponIDDiscount}",
                        )
                      : Text(
                          "${MyText.coupon.tr}: "
                          "${controller.ordersModel.ordersCouponIDDiscount} %",
                        )
                : Text("${MyText.coupon.tr}: ${MyText.noCoupon.tr}"),

            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${MyText.totalPrice.tr}: ",
                    style: TextStyle(
                      color: MyColor.themeBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controller.lang == 'ar'
                      ? Text(
                          "\$ ${controller.ordersModel.ordersTotalPrice}",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: MyColor.priceColor),
                        )
                      : Text(
                          "${controller.ordersModel.ordersTotalPrice} \$",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: MyColor.priceColor),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
