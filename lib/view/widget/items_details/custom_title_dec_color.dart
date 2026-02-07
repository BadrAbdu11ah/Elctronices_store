import 'package:electronics_store/controller/items/items_details_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleDecColor extends GetView<ItemsDetailsControllerImp> {
  final String title;
  final String dec;
  const CustomTitleDecColor({
    super.key,
    required this.title,
    required this.dec,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(height: 10),
        Text(dec, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 10),
        Text("Color", style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(height: 10),
        Row(
          children: [
            ...List.generate(controller.subItems.length, (int i) {
              return InkWell(
                onTap: () {
                  controller.selectedColor(i);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10),
                  height: 60,
                  width: 90,
                  decoration: BoxDecoration(
                    color: controller.subItems[i]["active"]
                        ? MyColor.themeBlackColor!
                        : Colors.white,
                    border: Border.all(
                      color: MyColor.themeBlackColor!,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    controller.subItems[i]["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: controller.subItems[i]["active"]
                          ? Colors.white
                          : MyColor.titleColor,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
