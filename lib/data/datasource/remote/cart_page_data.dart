import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class CartPageData {
  Crud curd;

  CartPageData(this.curd);

  Future viewCart(String usersid) async {
    var response = await curd.postData(MyLinkApi.cartView, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  void removeFavorite(String usersid, String itemsid) async {
    var response = await curd.postData(MyLinkApi.favoriteRemove, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future checkCoupon(String couponsname) async {
    var response = await curd.postData(MyLinkApi.checkcoupon, {
      "couponsname": couponsname,
    });
    return response.fold((l) => l, (r) => r);
  }
}
