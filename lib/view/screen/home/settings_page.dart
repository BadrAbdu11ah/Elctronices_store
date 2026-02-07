import 'package:electronics_store/controller/home/settings_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/constant/my_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsControllerImp> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          // وضع العناصر فوق بعضها
          clipBehavior: Clip.none, // السماح ببروز العناصر خارج الحدود
          alignment: Alignment.center, // محاذاة في المنتصف
          children: [
            Container(
              // خلفية الجزء العلوي
              height: Get.width / 2.2,
              color: MyColor.themeBlackColor,
            ),
            Positioned(
              // تحديد موقع الصورة الشخصية
              top: Get.width / 3.5,
              child: Container(
                // إطار الصورة الأبيض
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircleAvatar(
                  // الصورة الشخصية بشكل دائري
                  radius: 70,
                  backgroundColor: Colors.grey[100],
                  backgroundImage: AssetImage(MyImageAsset.badr),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 100), // مساحة فارغة للتعويض عن بروز الصورة
        Container(
          // حاوية القائمة
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            // بطاقة تحتوي الخيارات
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(controller.options.length, (i) {
                  return Column(
                    children: [
                      if (i != 0) Divider(),
                      ListTile(
                        onTap: controller.options[i]['onTap'],
                        title: Text(controller.options[i]['title']),
                        trailing: controller.options[i]['icon'],
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
