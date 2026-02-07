import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class ResetPasswordData {
  // نسخة من كلاس العمليات (Create, Read, Update, Delete)
  Crud curd;
  // كونستركتر: لاستلام نسخة الكرود عند إنشاء الكلاس
  ResetPasswordData(this.curd);
  // دالة لجلب البيانات من السيرفر بشكل غير متزامن
  Future postResetPasswordDataAndGet(String email, String password) async {
    // إرسال طلب بوست إلى الرابط المحدد واستقبال البيانات
    var response = await curd.postData(MyLinkApi.resetpasswordLink, {
      "email": email,
      "password": password,
    });
    // التعامل مع النتيجة: (l) تمثل الفشل أو الخطأ، (r) تمثل النجاح والبيانات
    return response.fold((l) => l, (r) => r);
  }
}
