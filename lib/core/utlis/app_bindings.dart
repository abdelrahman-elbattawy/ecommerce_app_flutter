import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Api Service
    Get.put(ApiService());

    //Auth
    Get.put(AuthRepoImpl(apiService: Get.find()));
  }
}
