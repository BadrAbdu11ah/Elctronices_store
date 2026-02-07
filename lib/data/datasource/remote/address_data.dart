import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class AddressData {
  Crud curd;

  AddressData(this.curd);

  Future addData(
    String usersid,
    String name,
    String city,
    String street,
    String lat,
    String long,
    String phone,
  ) async {
    var response = await curd.postData(MyLinkApi.addressAdd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future getData(String usersid) async {
    var response = await curd.postData(MyLinkApi.addressView, {
      'usersid': usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future editData(
    String addressesid,
    String name,
    String city,
    String street,
    String lat,
    String long,
    String phone,
  ) async {
    var response = await curd.postData(MyLinkApi.addressEdit, {
      'addressesid': addressesid,
      'name': name,
      'city': city,
      'street': street,
      'lat': lat,
      'long': long,
      'phone': phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  void removeData(String addressesid) async {
    var response = await curd.postData(MyLinkApi.addressRemove, {
      'addressesid': addressesid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
