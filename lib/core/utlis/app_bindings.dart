import 'package:ecommerce_app/features/auth/controller/verify_code_controller.dart';
import 'package:ecommerce_app/features/success/controller/success_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessControllerImpl(), fenix: true);
    Get.lazyPut(() => VerifyCodeControllerImpl(), fenix: true);
  }
}
