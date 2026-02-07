import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestViewController extends GetxController {
  // ربط طبقة البيانات بالمتحكم
  TestData testData = TestData(Get.find());

  // تغيير النوع من ماب إلى قائمة لأن السيرفر يرسل قائمة بيانات
  List data = [];

  // متغير لمراقبة حالة الطلب (تحميل، نجاح، خطأ)
  StateRequest stateRequest = StateRequest.none;

  Future<void> getData() async {
    // 1. تحديث الحالة إلى "جاري التحميل"
    stateRequest = StateRequest.loading;
    update();

    // 2. طلب البيانات من السيرفر
    var response = await testData.getData();

    // 3. فحص الرد (هل هو بيانات أم خطأ اتصال؟)
    stateRequest = handlingData(response);

    // 4. في حالة الفشل
    if (stateRequest != StateRequest.success) {
      update();
      return;
    }
    // 5. في حالةالفشل في السيرفر
    if (response['status'] != "success") {
      update();
      return;
    }
    // 6. في حالة النجاح
    data.addAll(response['data']);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
/*
كيف تعمل هذه المنظومة معاً؟
في معمارية التطبيقات الحديثة، يتم تقسيم العمل كالتالي:

Crud: مسؤول عن الاتصال الخام بالإنترنت (Post/Get).

TestData: مسؤول عن تحديد الروابط (يوآر إلس) ومعالجة شكل البيانات القادمة.

TestController: هو الوسيط الذي يطلب البيانات ويخزنها ليتم عرضها في الشاشة.
*/