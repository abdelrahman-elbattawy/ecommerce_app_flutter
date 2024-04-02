import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/controller/verify_code_controller.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterController extends GetxController {
  goToLogin();
  signUp();
  showPassword();
}

class RegisterControllerImpl extends RegisterController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  late GlobalKey<FormState> formState;

  bool isHiddenPassword = true;
  bool isLoading = false;

  late final AuthRepoImpl _authRepoImpl;

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      isLoading = true;

      var results = await _authRepoImpl.registerWithData(
        username.text,
        password.text,
        email.text,
        phone.text,
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
              Get.toNamed(
                AppRoutes.verifyCode,
                arguments: {
                  "viewType": ViewType.successSignUp,
                  "email": email.text,
                },
              );

              CustomSnakBar.showSnack(
                context: Get.context!,
                snackBarType: SnackBarType.success,
                errMessage: AppTranslationsKeys.snackBarRegisterSuccess.tr,
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
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    formState = GlobalKey<FormState>();
    _authRepoImpl = Get.find();
    super.onInit();
  }
}
