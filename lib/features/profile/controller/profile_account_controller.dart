import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/goto_tile_body_func.dart';
import 'package:ecommerce_app/core/functions/show_dialog_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/profile/data/models/list_tile_model.dart';
import 'package:ecommerce_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:ecommerce_app/features/profile/views/profile_personal_info_view.dart';
import 'package:ecommerce_app/features/profile/views/profile_security_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileAccountController extends GetxController {
  void intialListTile();
  void deleteAccount();
  void intialServices();
}

class ProfileAccountControllerImpl extends ProfileAccountController {
  late List<ListTileModel> listTiles;
  late final ProfileRepoImpl _profileRepoImpl;

  @override
  void onInit() {
    intialListTile();
    intialServices();

    super.onInit();
  }

  @override
  void intialListTile() {
    listTiles = [
      ListTileModel(
        iconData: Icons.person_2,
        title: AppTranslationsKeys.tabProfileMyAccountPersonalInfo,
        func: () => goToTileBody(ProfilePersonalInfoView.id),
      ),
      ListTileModel(
        iconData: Icons.shield,
        title: AppTranslationsKeys.tabProfileMyAccountSecurity,
        func: () => goToTileBody(ProfileSecurityView.id),
      ),
      ListTileModel(
        iconData: Icons.delete,
        title: AppTranslationsKeys.tabProfileSettingsDeleteAccount,
        func: deleteAccount,
      ),
    ];
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
                errMessage: AppTranslationsKeys.snackBarDeleteAccountSuccess.tr,
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

  @override
  void intialServices() {
    _profileRepoImpl = Get.find();
  }
}
