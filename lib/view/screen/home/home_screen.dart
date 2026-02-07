import 'package:electronics_store/controller/home/home_screen_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/view/widget/home/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenControllerImp> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.gotoCart();
            },
            shape: const CircleBorder(),
            child: Icon(Icons.shopping_basket_outlined, color: Colors.white),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomAppBar(),
          body: HandlingDataView(
            state: controller.stateRequest,
            child: IndexedStack(
              index: controller.currentPage,
              children: controller.listPage,
            ),
          ),
        );
      },
    );
  }
}
