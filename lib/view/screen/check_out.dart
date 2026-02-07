import 'package:electronics_store/controller/check_out_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/constant/my_image_asset.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/checkout/bottom_checkout.dart';
import 'package:electronics_store/view/widget/checkout/card_address_checkout.dart';
import 'package:electronics_store/view/widget/checkout/card_delivery_type.dart';
import 'package:electronics_store/view/widget/checkout/card_pyment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends GetView<CheckOutControllerImp> {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyText.checkoutButton.tr)),
      bottomNavigationBar: BottomCheckout(
        textButton: MyText.checkoutButton.tr,
        onCheckout: () {
          controller.checkout();
        },
      ),

      body: GetBuilder<CheckOutControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            state: controller.stateRequest,
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(
                    MyText.choosePaymentMethod.tr,
                    style: TextStyle(
                      color: MyColor.themeBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  CardPymentMethod(
                    onCard: () {
                      controller.choosePymentMethod("0"); // 0 => cash
                    },
                    title: MyText.cash.tr,
                    active: controller.paymentMethod == "0" ? true : false,
                  ),
                  SizedBox(height: 10),
                  CardPymentMethod(
                    onCard: () {
                      controller.choosePymentMethod("1"); // 1 => payment card
                    },
                    title: MyText.paymentCards.tr,
                    active: controller.paymentMethod == "1" ? true : false,
                  ),
                  SizedBox(height: 20),
                  Text(
                    MyText.chooseDeliveryType.tr,
                    style: TextStyle(
                      color: MyColor.themeBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CardDeliveryType(
                        onCard: () {
                          controller.chooseDeliveryType("0"); // 0 => Delivery
                        },
                        imageName: MyImageAsset.man,
                        title: MyText.delivery.tr,
                        active: controller.deliveryType == "0" ? true : false,
                      ),
                      SizedBox(width: 10),
                      CardDeliveryType(
                        onCard: () {
                          controller.chooseDeliveryType("1"); // Drive Thru
                        },
                        imageName: MyImageAsset.man,
                        title: MyText.driveThru.tr,
                        active: controller.deliveryType == "1" ? true : false,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  if (controller.deliveryType == "0")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyText.shippingAddress.tr,
                          style: TextStyle(
                            color: MyColor.themeBlackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        ...List.generate(controller.addressModel.length, (i) {
                          return CardAddressCheckout(
                            onCard: () {
                              controller.chooseShippingAddress(
                                controller.addressModel[i].addressesId
                                    .toString(),
                              );
                            },
                            title:
                                "${controller.addressModel[i].addressesName}",
                            body:
                                "${controller.addressModel[i].addressesCity}, ${controller.addressModel[i].addressesStreet}",
                            active:
                                controller.addressID ==
                                controller.addressModel[i].addressesId
                                    .toString(),
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
