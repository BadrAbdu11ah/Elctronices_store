import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class FavoriteData {
  Crud curd;

  FavoriteData(this.curd);

  Future addFavorite(String usersid, String itemsid) async {
    var response = await curd.postData(MyLinkApi.favoriteAdd, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future removeFavorite(String usersid, String itemsid) async {
    var response = await curd.postData(MyLinkApi.favoriteRemove, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
