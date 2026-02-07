import 'package:electronics_store/controller/address/view_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/view/widget/address/card_address.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AddressView extends GetView<AddressViewControllerImp> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            controller.goToAddressAdd();
          },
          shape: const CircleBorder(),
          child: Icon(Icons.add, color: MyColor.bgColorOnBoarding, size: 35),
        ),
      ),
      appBar: AppBar(title: Text("العناوين")),
      body: GetBuilder<AddressViewControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            state: controller.stateRequest,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: controller.addresses.length,
                itemBuilder: (BuildContext context, int i) {
                  return CardAddress(
                    addressModel: controller.addresses[i],
                    onDelete: () {
                      controller.deleteAddress(
                        controller.addresses[i].addressesId!,
                      );
                    },
                    onEdit: () {
                      controller.editAddress();
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
