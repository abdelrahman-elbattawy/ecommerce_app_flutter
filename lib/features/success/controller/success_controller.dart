import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessController extends GetxController {
  setSuccessLabel(String text);
  goToHomePage();
}

class SuccessControllerImpl extends SuccessController {
  late String textLabel;

  @override
  setSuccessLabel(String text) {
    textLabel = text;
  }

  @override
  goToHomePage() {
    // Get.offAllNamed(AppRoutes.homeView);
    Get.offAllNamed(AppRoutes.login);
  }
}
