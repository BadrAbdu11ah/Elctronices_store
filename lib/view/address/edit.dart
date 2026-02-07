import 'package:electronics_store/controller/address/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressEdit extends GetView<AddressEditControllerImp> {
  const AddressEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تعديل العناوين", style: TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: Text(
          '....ستتم إضافة هذه الميزة لاحقا',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
