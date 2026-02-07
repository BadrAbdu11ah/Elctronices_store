// استيراد مكتبة الواجهات الخاصة بـ Flutter
import 'package:flutter/material.dart';
// استيراد مكتبة الموقع الجغرافي للتعامل مع الـ GPS
import 'package:geolocator/geolocator.dart';

// تعريف "ودجت" من نوع StatefulWidget لأننا قد نحتاج لتحديث الحالة لاحقاً
class GeolocatorLearning extends StatefulWidget {
  const GeolocatorLearning({super.key});

  @override
  State<GeolocatorLearning> createState() => _GeolocatorLearningState();
}

class _GeolocatorLearningState extends State<GeolocatorLearning> {
  getCurrentPositionApp() async {
    // التأكد من أن خدمة الموقع (GPS) مفعلة في إعدادات الهاتف نفسه
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('الرجاء تشغيل إعدادات الموقع');
      return;
    }

    // فحص هل يمتلك التطبيق "إذن" من المستخدم للوصول للموقع
    LocationPermission permission = await Geolocator.checkPermission();

    // إذا كان الإذن مرفوضاً، نقوم بطلبه من المستخدم
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('تم رفض الوصول للموقع من قبل المستخدم');
        return;
      }
    }

    // في حال قام المستخدم برفض الإذن نهائياً من إعدادات النظام
    if (permission == LocationPermission.deniedForever) {
      print('صلاحيات الموقع مرفوضة بشكل دائم، لا يمكننا طلبها برمجياً');
      return;
    }

    // اخذ الموقع الحالي
    Position position = await Geolocator.getCurrentPosition();
    print("lat: ${position.latitude}\nlong: ${position.longitude}");
  }

  @override
  void initState() {
    super.initState();
    getCurrentPositionApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اختبار الموقع")),
      body: Center(
        child: Text(
          "تم أخذ الموقع الحالي\nسيتم عرض الخريطة لاحقا",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
