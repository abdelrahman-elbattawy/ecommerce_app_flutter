import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/home/controller/home_tab_bar_controller.dart';
import 'package:ecommerce_app/features/profile/data/models/list_tile_model.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_settings_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileSettingsController extends GetxController {
  void intialListTiles();
  void goToLanguageView();
}

class ProfileSettingsControllerImpl extends ProfileSettingsController {
  late List<ListTileModel> listTiles;

  @override
  void onInit() {
    intialListTiles();
    super.onInit();
  }

  @override
  void intialListTiles() {
    listTiles = [
      ListTileModel(
        iconData: Icons.language,
        title: AppTranslationsKeys.tabProfileSettingsLanguage,
        func: goToLanguageView,
      ),
      ListTileModel(
        iconData: Icons.delete,
        title: AppTranslationsKeys.tabProfileSettingsDeleteAccount,
      ),
    ];
  }

  @override
  void goToLanguageView() {
    final controller = Get.find<HomeTabBarControllerImpl>();
    controller.setCurrentIndex(ProfileSettingsLanguage.id);
  }
}
