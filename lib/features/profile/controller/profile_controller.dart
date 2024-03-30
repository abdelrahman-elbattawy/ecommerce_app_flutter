import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/show_dialog_func.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/features/home/controller/home_tab_bar_controller.dart';
import 'package:ecommerce_app/features/profile/data/models/list_tile_model.dart';
import 'package:ecommerce_app/features/profile/views/profile_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  void signOut();
  void intialServices();
  void intialListTile();
  void goToTileBody(int index);
}

class ProfileControllerImpl extends ProfileController {
  late final AppServices _appServices;

  late List<ListTileModel> listTiles;

  @override
  void onInit() {
    intialListTile();
    intialServices();
    super.onInit();
  }

  @override
  void signOut() {
    showMyDialog(
      Get.context,
      AppTranslationsKeys.showDialogSignOutTitle.tr,
      AppTranslationsKeys.showDialogSignOutBody.tr,
    ).then(
      (value) {
        if (value) {
          _appServices.sharedPreferences
              .setString(AppPreferencesKeys.onAppSteps, "1");

          _appServices.sharedPreferences.remove(AppPreferencesKeys.userModel);
          Get.offAllNamed(AppRoutes.login);
        }
      },
    );
  }

  @override
  void intialServices() {
    _appServices = Get.find();
  }

  @override
  void intialListTile() {
    listTiles = [
      ListTileModel(
        iconData: Icons.person_2,
        title: AppTranslationsKeys.tabProfileMyAccount.tr,
      ),
      ListTileModel(
        iconData: Icons.credit_card,
        title: AppTranslationsKeys.tabProfilePaymentMethods.tr,
      ),
      ListTileModel(
        iconData: Icons.help_center,
        title: AppTranslationsKeys.tabProfileHelpCenter.tr,
      ),
      ListTileModel(
        iconData: Icons.settings,
        title: AppTranslationsKeys.tabProfileSettings.tr,
        func: () => goToTileBody(ProfileSettingsView.id),
      ),
      ListTileModel(
        iconData: Icons.logout,
        title: AppTranslationsKeys.tabProfileSignOut.tr,
        func: signOut,
      ),
    ];
  }

  @override
  void goToTileBody(int index) {
    final controller = Get.find<HomeTabBarControllerImpl>();
    controller.setCurrentIndex(index);
  }
}
