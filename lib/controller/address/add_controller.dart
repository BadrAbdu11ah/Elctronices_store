import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

abstract class AddressAddController extends GetxController {
  void initialData();
  void getCurrentPositionApp();
  void addMarkers(Position position);
  void goToAddressAddDetails();
}

class AddressAddControllerImp extends AddressAddController {
  StateRequest stateRequest = StateRequest.none;

  Position? position;

  double? lat;
  double? long;

  @override
  void initialData() async {
    await getCurrentPositionApp();

    if (position != null) {
      addMarkers(position!);
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void addMarkers(Position pos) {
    lat = pos.latitude;
    long = pos.longitude;
    update();
  }

  @override
  Future getCurrentPositionApp() async {
    stateRequest = StateRequest.loading;
    update();

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      stateRequest = StateRequest.failure;
      Get.snackbar("تنبيه", 'الرجاء تشغيل إعدادات الموقع');
      update();
      return;
    }

    // فحص أذونات الوصول للموقع
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        stateRequest = StateRequest.failure;
        Get.snackbar('تنبيه', 'تم رفض الوصول للموقع');
        update();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      stateRequest = StateRequest.failure;
      Get.snackbar("تنبيه", 'صلاحيات الموقع مرفوضة بشكل دائم');
      update();
      return;
    }
    position = await Geolocator.getCurrentPosition();

    if (position == null) {
      stateRequest = StateRequest.failure;
    }

    stateRequest = StateRequest.success;
    print('lat: ${position!.latitude}\nlong: ${position!.longitude}');
    update();
  }

  @override
  void goToAddressAddDetails() {
    if (lat != null && long != null) {
      Get.toNamed(
        MyPages.addressAddDetails,
        arguments: {'lat': lat.toString(), 'long': long.toString()},
      );
    } else {
      Get.snackbar("تنبيه", "يرجى تحديد الموقع أولاً");
    }
  }
}
