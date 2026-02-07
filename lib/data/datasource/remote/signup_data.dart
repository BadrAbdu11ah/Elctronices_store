import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class SignupData {
  // نسخة من كلاس العمليات (Create, Read, Update, Delete)
  Crud curd;
  // كونستركتر: لاستلام نسخة الكرود عند إنشاء الكلاس
  SignupData(this.curd);
  // دالة لجلب البيانات من السيرفر بشكل غير متزامن
  Future postSignupDataAndGet(
    String username,
    String email,
    String password,
    String phone,
  ) async {
    // إرسال طلب بوست إلى الرابط المحدد واستقبال البيانات
    var response = await curd.postData(MyLinkApi.signupLink, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    // التعامل مع النتيجة: (l) تمثل الفشل أو الخطأ، (r) تمثل النجاح والبيانات
    return response.fold((l) => l, (r) => r);
  }
}
