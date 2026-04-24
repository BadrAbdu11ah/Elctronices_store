import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class ItemsData {
  Crud curd; // نسخة من كلاس العمليات (Create, Read, Update, Delete)

  ItemsData(this.curd); // كونستركتر: لاستلام نسخة الكرود عند إنشاء الكلاس

  // دالة لجلب البيانات من السيرفر بشكل غير متزامن
  Future getData(String id, String usersid) async {
    // إرسال طلب بوست إلى الرابط المحدد مع بيانات فارغة
    var response = await curd.postData(MyLinkApi.itemsLink, {
      "categoriesid": id,
      "usersid": usersid,
    });
    // التعامل مع النتيجة: (l) تمثل الفشل أو الخطأ، (r) تمثل النجاح والبيانات
    return response.fold((l) => l, (r) => r);
  }
}
