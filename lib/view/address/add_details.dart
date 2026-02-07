import 'package:electronics_store/controller/address/add_details_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/core/shared/custom_button.dart';
import 'package:electronics_store/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends GetView<AddressAddDetailsControllerImp> {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل العنوان")),
      body: GetBuilder<AddressAddDetailsControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            state: controller.stateRequest,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  CustomTextFormAuth(
                    hintText: 'Name',
                    labelText: 'Name',
                    iconData: Icons.person,
                    myController: controller.name,
                    valid: (val) {
                      return null;
                    },
                  ),
                  CustomTextFormAuth(
                    hintText: 'City',
                    labelText: 'City',
                    iconData: Icons.location_city_rounded,
                    myController: controller.city,
                    valid: (val) {
                      return null;
                    },
                  ),
                  CustomTextFormAuth(
                    hintText: 'Street',
                    labelText: 'Street',
                    iconData: Icons.streetview_rounded,
                    myController: controller.street,
                    valid: (val) {
                      return null;
                    },
                  ),
                  CustomTextFormAuth(
                    hintText: 'Phone',
                    labelText: 'Phone',
                    iconData: Icons.phone_android_rounded,
                    myController: controller.phone,
                    valid: (val) {
                      return null;
                    },
                  ),
                  CustomButton(
                    text: "Add",
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.addData();
                    },
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
