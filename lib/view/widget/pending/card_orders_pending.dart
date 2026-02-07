import 'package:electronics_store/controller/orders/pending_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardOrdersPending extends GetView<OrdersPendingControllerImp> {
  final String orderid;
  final String createdAt;
  final String pymentMethod;
  final String orderType;
  final String orderStatus;
  final String totalPrice;
  final String ordersTotalPrice;
  final void Function() onDetails;
  final String details;
  const CardOrdersPending({
    super.key,
    required this.orderid,
    required this.createdAt,
    required this.pymentMethod,
    required this.orderType,
    required this.orderStatus,
    required this.totalPrice,
    required this.ordersTotalPrice,
    required this.onDetails,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  orderid,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                Text(createdAt),
              ],
            ),
            Divider(),
            Text(pymentMethod),
            Text(orderType),

            Text(orderStatus),
            Divider(),
            Row(
              children: [
                Text(
                  totalPrice,
                  style: TextStyle(
                    color: MyColor.themeBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ordersTotalPrice,
                  style: TextStyle(
                    color: MyColor.priceColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                MaterialButton(
                  color: MyColor.themeColor,
                  textColor: MyColor.bgColorOnBoarding,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: onDetails,
                  child: Text(details, style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
