import 'package:electronics_store/api_endpoints.dart';
import 'package:electronics_store/core/services/api_service.dart';
import 'package:electronics_store/features/auth/service/auth_service.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiService>(
      ApiService(baseUrl: ApiEndpoints.server, myService: Get.find()),
      permanent: true,
    );

    Get.put(AuthService(), permanent: true);
  }
}
