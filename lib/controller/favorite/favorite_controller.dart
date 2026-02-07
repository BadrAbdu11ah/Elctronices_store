import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  void setFavorite(int id, dynamic val);
  void addFavorite(String itemsid);
  void removeFavorite(String itemsid);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};

  MyService myService = Get.find();

  FavoriteData favoriteData = FavoriteData(Get.find());

  StateRequest stateRequest = StateRequest.none;

  @override
  void setFavorite(int id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  void addFavorite(itemsid) async {
    print("========================= addFavorite");
    var response = await favoriteData.addFavorite(
      myService.sharedPreferences.getString("id")!,
      itemsid.toString(),
    );
    stateRequest = handlingData(response);
    if (stateRequest != StateRequest.success) {
      update();
      return;
    }
    if (response['status'] != "success") {
      stateRequest = StateRequest.failure;
      update();
      return;
    }
    print("=================== response: $response");
    Get.rawSnackbar(title: "تنبيه", message: "تم إضافة المنتج إلى المفضلة");
  }

  @override
  void removeFavorite(itemsid) async {
    print("========================= removeFavorite");
    var response = await favoriteData.removeFavorite(
      myService.sharedPreferences.getString("id")!,
      itemsid.toString(),
    );
    stateRequest = handlingData(response);
    if (stateRequest != StateRequest.success) {
      update();
      return;
    }
    if (response['status'] != "success") {
      stateRequest = StateRequest.failure;
      update();
      return;
    }
    print("=================== response: $response");
    Get.rawSnackbar(title: "تنبيه", message: "تم حذف المنتج من المفضلة");
  }
}
