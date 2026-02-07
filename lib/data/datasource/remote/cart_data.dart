import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class CartData {
  Crud curd;

  CartData(this.curd);

  Future addCart(String usersid, String itemsid) async {
    var response = await curd.postData(MyLinkApi.cartAdd, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future removeCart(String usersid, String itemsid) async {
    var response = await curd.postData(MyLinkApi.cartRemove, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future countCart(String usersid, String itemsid) async {
    var response = await curd.postData(MyLinkApi.cartCount, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
