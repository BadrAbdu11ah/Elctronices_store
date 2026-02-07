import 'package:electronics_store/controller/address/add_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAdd extends GetView<AddressAddControllerImp> {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: MaterialButton(
          height: 50,
          textColor: MyColor.bgColorOnBoarding,
          color: MyColor.themeColor,
          onPressed: () {
            controller.goToAddressAddDetails();
          },
          child: Text("تفاصيل العناوين", style: TextStyle(fontSize: 20)),
        ),
      ),
      appBar: AppBar(title: Text("إضافة عنوان")),
      body: GetBuilder<AddressAddControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            state: controller.stateRequest,
            child: Center(
              child: Text(
                "تم أخذ الموقع الحالي\nسيتم عرض الخريطة لاحقا",
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
