import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class OrdersPendingData {
  Crud curd;

  OrdersPendingData(this.curd);

  Future getData(String usersid) async {
    var response = await curd.postData(MyLinkApi.ordersPending, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
