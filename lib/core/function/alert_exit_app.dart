import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future alertExitApp() {
  return Get.defaultDialog(
    title: "تنبيه",
    middleText: "هل تريد الخروج من التطبيق",
    actions: [
      ElevatedButton(
        onPressed: () {
          SystemNavigator.pop();
        },
        child: Text("Confirm"),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Cancel"),
      ),
    ],
  );
}
