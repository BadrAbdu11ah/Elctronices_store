import 'package:electronics_store/controller/orders/details_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/orders_details/card_orders_datails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetails extends GetView<OrdersDetailsControllerImp> {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyText.orderDetailsTitle.tr)),
      body: GetBuilder<OrdersDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          state: controller.stateRequest,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                CardOrdersDatails(),
                SizedBox(height: 10),
                if (controller.addressModel != null)
                  Card(
                    child: ListTile(
                      title: Text(
                        MyText.shippingAddress.tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyColor.themeBlackColor,
                        ),
                      ),
                      subtitle: Text(
                        "${controller.addressModel!.addressesCity}, ${controller.addressModel!.addressesStreet}",
                      ),
                    ),
                  ),
                SizedBox(height: 10),
                if (controller.addressModel != null)
                  Card(
                    child: SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(MyText.mapLater.tr),
                          SizedBox(height: 10),
                          if (controller.position == null)
                            MaterialButton(
                              color: MyColor.themeColor,
                              textColor: MyColor.bgColorOnBoarding,
                              onPressed: () {
                                controller.getCurrentPositionApp();
                              },
                              child: Text(MyText.getCurrentLocation.tr),
                            ),
                          if (controller.position != null)
                            Text(
                              'lat: ${controller.position!.latitude}\nlong: ${controller.position!.longitude}',
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
