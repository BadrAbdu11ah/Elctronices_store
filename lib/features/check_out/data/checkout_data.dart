import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class CheckoutData {
  Crud curd;

  CheckoutData(this.curd);

  Future getData(Map data) async {
    var response = await curd.postData(MyLinkApi.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
