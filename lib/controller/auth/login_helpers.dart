import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/login_data.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> handleSuccessLogin(
  Map<String, dynamic> response,
  MyService myService,
) async {
  await myService.sharedPreferences.setString(
    'id',
    response['data']["users_id"].toString(),
  );
  await myService.sharedPreferences.setString(
    'username',
    response['data']["users_name"],
  );
  await myService.sharedPreferences.setString(
    'email',
    response['data']["users_email"],
  );
  await myService.sharedPreferences.setString(
    'phone',
    response['data']["users_phone"],
  );
  await myService.sharedPreferences.setString('step', "2");
  Get.offAllNamed(MyPages.homeScreen);
}

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

Future<void> resendVerifyCode({
  required LoginData loginData,
  required String email,
  required MyService myService,
}) async {
  final response = await loginData.postResendVerifycodeDataAndGet(email);

  final state = handlingData(response);

  if (state == StateRequest.success && response["status"] == "success") {
    await myService.sharedPreferences.setString("emailsignup", email);
    Get.offNamed(MyPages.verfiyCodeSginUp);
  } else {
    Get.snackbar(MyText.error, MyText.messagewarningAlready);
  }
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
