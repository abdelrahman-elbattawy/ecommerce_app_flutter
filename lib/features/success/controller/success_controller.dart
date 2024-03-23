import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class SuccessController extends GetxController {
  goToHomePage();
}

class SuccessControllerImpl extends SuccessController {
  late String textLabel;

  @override
  void onInit() {
    textLabel = Get.arguments["textLabelSuccessView"];
    super.onInit();
  }

  @override
  goToHomePage() {
    Get.offAllNamed(AppRoutes.login);
  }
}
