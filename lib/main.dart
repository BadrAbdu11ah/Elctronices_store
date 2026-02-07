import 'package:electronics_store/bindings/init_binding.dart';
import 'package:electronics_store/core/localization/change_local.dart';
import 'package:electronics_store/my_translations.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/my_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  Get.put(LocaleController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      title: 'Electronics Store',
      initialBinding: InitBinding(),
      getPages: pages,
    );
  }
}
