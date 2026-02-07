import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class LoginData {
  Crud curd; // نسخة من كلاس العمليات (Create, Read, Update, Delete)

  LoginData(this.curd); // كونستركتر: لاستلام نسخة الكرود عند إنشاء الكلاس

  // دالة لجلب البيانات من السيرفر بشكل غير متزامن
  Future postLoginDataAndGet(String email, String password) async {
    var response = await curd.postData(MyLinkApi.loginLink, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }

  // دالة لجلب البيانات من السيرفر بشكل غير متزامن
  Future postResendVerifycodeDataAndGet(String email) async {
    // إرسال طلب بوست إلى الرابط المحدد واستقبال البيانات
    var response = await curd.postData(MyLinkApi.chickemailLink, {
      "email": email,
    });
    // التعامل مع النتيجة: (l) تمثل الفشل أو الخطأ، (r) تمثل النجاح والبيانات
    return response.fold((l) => l, (r) => r);
  }
}
