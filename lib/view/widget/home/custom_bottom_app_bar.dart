import 'package:electronics_store/controller/home/home_screen_controller.dart';
import 'package:electronics_store/view/widget/home/custom_bottom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends GetView<HomeScreenControllerImp> {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey[300],
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          ...List.generate(controller.listPage.length + 1, (index) {
            int i = index > 2 ? index - 1 : index;
            return index == 2
                ? Spacer()
                : CustomBottomIcon(
                    onIcon: () {
                      controller.changePage(i);
                    },
                    icon: controller.currentPage == i
                        ? controller.iconActive[i]
                        : controller.iconNotActive[i],
                    textIcon: controller.lang == 'en'
                        ? controller.titleBottomEn[i]
                        : controller.titleBottomAr[i],
                    active: controller.currentPage == i ? true : false,
                  );
          }),
        ],
      ),
    );
  }
}
