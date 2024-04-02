import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/controller/verify_code_controller.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordController extends GetxController {
  checkEmail();
}

class ForgotPasswordControllerImpl extends ForgotPasswordController {
  late TextEditingController email;
  late GlobalKey<FormState> formState;

  bool isLoading = false;

  late final AuthRepoImpl _authRepoImpl;

  @override
  void onInit() {
    email = TextEditingController();
    formState = GlobalKey<FormState>();
    _authRepoImpl = Get.find();
    super.onInit();
  }

  @override
  checkEmail() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      isLoading = true;

      var results = await _authRepoImpl.forgotPassowdWith(
        email.text,
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
                  "viewType": ViewType.resetPassword,
                  "email": email.text,
                },
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
