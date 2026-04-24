import 'package:electronics_store/core/class/crud.dart';
import 'package:electronics_store/my_link_api.dart';

class FavoritePageData {
  Crud curd;

  FavoritePageData(this.curd);

  Future viewFavorite(String usersid) async {
    var response = await curd.postData(MyLinkApi.favoriteView, {
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
}
