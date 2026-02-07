import 'package:electronics_store/controller/test_view_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends GetView<TestViewController> {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Page"), backgroundColor: Colors.blue),
      body: GetBuilder<TestViewController>(
        builder: (controller) {
          return HandlingDataView(
            state: controller.stateRequest,
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  child: ListTile(
                    title: Text("${controller.data[i]['users_name']}"),
                    subtitle: Text("${controller.data[i]['users_email']}"),
                    leading: Text("${controller.data[i]['users_id']}"),
                    trailing: Text("${controller.data[i]['users_create']}"),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
