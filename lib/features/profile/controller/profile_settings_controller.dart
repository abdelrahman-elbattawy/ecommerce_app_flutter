import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/show_dialog_func.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/controller/home_tab_bar_controller.dart';
import 'package:ecommerce_app/features/profile/data/models/list_tile_model.dart';
import 'package:ecommerce_app/features/profile/data/models/repos/profile_repo_impl.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_settings_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileSettingsController extends GetxController {
  void intialListTiles();
  void goToLanguageView();
  void deleteAccount();
}

class ProfileSettingsControllerImpl extends ProfileSettingsController {
  late List<ListTileModel> listTiles;

  final ProfileRepoImpl _profileRepoImpl = Get.find();

  @override
  void onInit() {
    intialListTiles();
    initialServices();

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
        func: deleteAccount,
      ),
    ];
  }

  @override
  void goToLanguageView() {
    final controller = Get.find<HomeTabBarControllerImpl>();
    controller.setCurrentIndex(ProfileSettingsLanguage.id);
  }

  @override
  void deleteAccount() {
    showMyDialog(
      Get.context,
      AppTranslationsKeys.showDialogDeleteAccountTitle.tr,
      AppTranslationsKeys.showDialogDeleteAccountBody.tr,
    ).then(
      (value) async {
        if (value) {
          final UserModel userModel = Get.find<HomeControllerImpl>().userModel;
          final results =
              await _profileRepoImpl.deleteAccountBy(userModel.email!);

          results.fold(
            (failure) {
              CustomSnakBar.showSnack(
                context: Get.context!,
                snackBarType: SnackBarType.error,
                errMessage: failure.errMessage,
              );
            },
            (data) {
              CustomSnakBar.showSnack(
                context: Get.context!,
                snackBarType: SnackBarType.success,
                errMessage: "Your account has been deleted!",
              );

              Future.delayed(
                const Duration(milliseconds: 900),
                () => Get.offAllNamed(AppRoutes.login),
              );
            },
          );
        }
      },
    );
  }
}
