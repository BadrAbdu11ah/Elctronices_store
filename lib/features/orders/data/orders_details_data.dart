import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class OrdersDetailsData {
  Crud curd;

  OrdersDetailsData(this.curd);

  Future getData(String usersid, String ordersid, String addressid) async {
    var response = await curd.postData(MyLinkApi.ordersDetails, {
      'usersid': usersid,
      'ordersid': ordersid,
      'addressid': addressid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
