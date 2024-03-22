import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/auth/controller/verify_code_controller.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/success/controller/success_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessControllerImpl(), fenix: true);
    Get.lazyPut(() => VerifyCodeControllerImpl(), fenix: true);

    Get.put(ApiService());

    //Auth
    Get.put(AuthRepoImpl(apiService: Get.find()));
  }
}
