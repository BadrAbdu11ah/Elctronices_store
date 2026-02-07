import 'package:electronics_store/controller/orders/pending_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/pending/card_orders_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersPending extends GetView<OrdersPendingControllerImp> {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyText.ordersTitle.tr)),
      body: GetBuilder<OrdersPendingControllerImp>(
        builder: (controller) => HandlingDataView(
          state: controller.stateRequest,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: controller.ordersModel.length,
              itemBuilder: (BuildContext context, int i) => CardOrdersPending(
                orderid: "#${controller.ordersModel[i].ordersId}",
                createdAt: Jiffy.parse(
                  controller.ordersModel[i].createdAt!,
                  pattern: "yyyy-MM-dd",
                ).fromNow(),
                pymentMethod:
                    "${MyText.paymentMethod.tr} ${controller.printPaymentMethod(controller.ordersModel[i].ordersPaymentMethod.toString()).tr}",
                orderType:
                    "${MyText.orderType.tr} ${controller.printDeliveryType(controller.ordersModel[i].ordersType.toString()).tr}",
                orderStatus:
                    "${MyText.orderStatus.tr} ${controller.printOrderStatus(controller.ordersModel[i].ordersStatus.toString()).tr}",
                totalPrice: "${MyText.totalPrice.tr}: ",
                ordersTotalPrice:
                    "${controller.ordersModel[i].ordersTotalPrice} \$",
                onDetails: () {
                  controller.goToOrdersDetails(controller.ordersModel[i]);
                },
                details: MyText.details.tr,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
