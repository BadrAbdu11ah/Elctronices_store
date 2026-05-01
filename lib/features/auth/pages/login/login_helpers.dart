import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:electronics_store/features/auth/service/auth_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> handleSuccessLogin(Map<String, dynamic> response) async {
  AuthService authService = Get.find<AuthService>();
  MyService myService = Get.find<MyService>();

  // 1. حفظ البيانات والتوكن مركزياً
  await authService.saveAuthData(response);

  // 2. تحديث الـ Step للميدل وير (Middleware)
  await myService.sharedPreferences.setString('step', "2");

  // 3. الانتقال للرئيسية
  Get.offAllNamed(MyPages.homeScreen);
}

// دالة التنبيه للحساب غير النشط
void handleAccountNotActive({required void Function() onpressed}) {
  Get.defaultDialog(
    title: MyText.warning.tr,
    middleText: MyText.accountNotActive.tr,
    actions: [
      ElevatedButton(onPressed: onpressed, child: Text(MyText.activateNow.tr)),
      ElevatedButton(onPressed: Get.back, child: Text(MyText.cancel.tr)),
    ],
  );
}

//------------------------------
// خاص بإرسال الإشعارات
//------------------------------
Future<void> initFirebaseStuff() async {
  await myRequestPermissions();
  // await getToken();
}

// أخذ الرمز الخاص بالجهاز لإرسال الرسائل عليه
// Future<void> getToken() async {
//   String? myToken = await FirebaseMessaging.instance.getToken();
//   print("================================");
//   print("Token: $myToken");
//   print("================================");
// }

// التأكد من أن الجهاز يقبل الإشعارات
Future<void> myRequestPermissions() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print("-------------------------------------------------------------");
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}
