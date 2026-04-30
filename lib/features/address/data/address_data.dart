import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';

class AddressData {
  final ApiService api;

  AddressData(this.api);

  // 1. جلب كافة العناوين (استخدام GET)
  Future getData() async {
    var response = await api.get(ApiEndpoints.addressView);
    return response.fold((l) => l, (r) => r);
  }

  // 2. إضافة عنوان جديد (استخدام POST)
  Future addData(
    String name,
    String city,
    String street,
    String lat,
    String long,
    String phone,
  ) async {
    var response = await api.post(ApiEndpoints.addressAdd, {
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  // 3. تعديل عنوان موجود (استخدام PUT وتمرير الـ ID في الرابط)
  Future editData(
    int addressId,
    String name,
    String city,
    String street,
    String lat,
    String long,
    String phone,
  ) async {
    var response = await api.put(ApiEndpoints.addressEdit(addressId), {
      'name': name,
      'city': city,
      'street': street,
      'lat': lat,
      'long': long,
      'phone': phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  // 4. حذف عنوان (استخدام DELETE وتمرير الـ ID في الرابط)
  Future removeData(int addressId) async {
    var response = await api.delete(ApiEndpoints.addressRemove(addressId));
    return response.fold((l) => l, (r) => r);
  }
}
