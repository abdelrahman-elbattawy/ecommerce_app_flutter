import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/show_dialog_func.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  void signOut();
  void intialServices();
  void intialListTile();
}

class ProfileControllerImpl extends ProfileController {
  late final AppServices _appServices;

  late List<ProfileModel> listTiles;

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
      ProfileModel(
        iconData: Icons.person_2,
        title: AppTranslationsKeys.homeProfileMyAccount.tr,
      ),
      ProfileModel(
        iconData: Icons.credit_card,
        title: AppTranslationsKeys.homeProfilePaymentMethods.tr,
      ),
      ProfileModel(
        iconData: Icons.help_center,
        title: AppTranslationsKeys.homeProfileHelpCenter.tr,
      ),
      ProfileModel(
        iconData: Icons.settings,
        title: AppTranslationsKeys.homeProfileSettings.tr,
      ),
      ProfileModel(
        iconData: Icons.logout,
        title: AppTranslationsKeys.homeProfileSignOut.tr,
        func: signOut,
      ),
    ];
  }
}
