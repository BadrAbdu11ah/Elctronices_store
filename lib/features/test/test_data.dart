import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class TestData {
  Crud curd;

  TestData(this.curd);

  Future getData() async {
    var response = await curd.postData(MyLinkApi.homeLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
