import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  savePassword();
  showPassword();
  showRePassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  late GlobalKey<FormState> formState;

  bool isHiddenPassword = true;
  bool isHiddenRePassword = true;
  bool isLoading = false;

  late String email;
  late final AuthRepoImpl _authRepoImpl;

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    formState = GlobalKey<FormState>();
    _authRepoImpl = Get.find();
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  savePassword() async {
    var formData = formState.currentState;

    if (formData!.validate()) {
      isLoading = true;

      var results = await _authRepoImpl.resetPasswordWith(
        email,
        password.text,
      );

      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          isLoading = false;

          results.fold(
            (failure) {
              CustomSnakBar.showSnack(
                context: Get.context!,
                snackBarType: SnackBarType.error,
                errMessage: failure.errMessage,
              );
            },
            (data) {
              Get.offAllNamed(
                AppRoutes.successView,
                arguments: {
                  "textLabelSuccessView":
                      AppTranslationsKeys.successViewText1.tr,
                },
              );

              CustomSnakBar.showSnack(
                context: Get.context!,
                snackBarType: SnackBarType.success,
                errMessage: AppTranslationsKeys.snackBarResetPasswordSuccess.tr,
              );
            },
          );

          update();
        },
      );

      update();
    }
  }

  @override
  showPassword() {
    isHiddenPassword = isHiddenPassword ? false : true;
    update();
  }

  @override
  showRePassword() {
    isHiddenRePassword = isHiddenRePassword ? false : true;
    update();
  }
}
