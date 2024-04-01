import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:get/get.dart';

abstract class LanguageController extends GetxController {
  setCurrentIndex(int index);
}

class LanguageControllerImpl extends LanguageController {
  int currentIndex = -1;
  AppServices appServices = Get.find();

  @override
  void onInit() {
    String? codeLang = appServices.sharedPreferences
        .getString(AppPreferencesKeys.languageCode);

    if (codeLang == "AR") {
      currentIndex = 1;
    } else if (codeLang == "EN") {
      currentIndex = 0;
    } else {
      currentIndex = -1;
    }

    super.onInit();
  }

  @override
  setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
}
