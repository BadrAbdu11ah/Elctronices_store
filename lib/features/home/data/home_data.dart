import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class HomeData {
  Crud curd;

  HomeData(this.curd);

  Future getData() async {
    var response = await curd.postData(MyLinkApi.homeLink, {});

    return response.fold((l) => l, (r) => r);
  }

  Future searchData(String search) async {
    var response = await curd.postData(MyLinkApi.searchLink, {
      "search": search,
    });

    return response.fold((l) => l, (r) => r);
  }
}
