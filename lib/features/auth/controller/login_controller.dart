import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/controller/verify_code_controller.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  goToRegisterView();
  goToForgotPassword();
  login();
  showPassword();
}

class LoginControllerImpl extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> formState;

  bool isHiddenPassword = true;
  bool isLoading = false;

  late final AuthRepoImpl _authRepoImpl;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    formState = GlobalKey<FormState>();
    _authRepoImpl = Get.find();
    super.onInit();
  }

  @override
  showPassword() {
    isHiddenPassword = isHiddenPassword ? false : true;
    update();
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      var formData = formState.currentState;
      if (formData!.validate()) {
        isLoading = true;

        var results = await _authRepoImpl.loginWithData(
          email.text,
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

                if (failure.errMessage == "Email not verifed") {
                  Get.toNamed(
                    AppRoutes.verifyCode,
                    arguments: {
                      "viewType": ViewType.successSignUp,
                      "email": email.text,
                    },
                  );
                }
              },
              (data) {
                Get.toNamed(AppRoutes.home);

                CustomSnakBar.showSnack(
                  context: Get.context!,
                  snackBarType: SnackBarType.success,
                  errMessage: AppTranslationsKeys.snackBarLoginSuccess.tr,
                );
              },
            );

            update();
          },
        );

        update();
      }
    }
  }

  @override
  goToRegisterView() {
    Get.toNamed(AppRoutes.register);
  }

  @override
  goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
