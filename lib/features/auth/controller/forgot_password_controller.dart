import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/features/auth/controller/verify_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotPasswordController extends GetxController {
  checkEmail(String email);
  goToVerifyCode();
}

class ForgotPasswordControllerImpl extends ForgotPasswordController {
  late TextEditingController email;
  late GlobalKey<FormState> formState;

  @override
  void onInit() {
    email = TextEditingController();
    formState = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  goToVerifyCode() {
    var formData = formState.currentState;

    if (formData!.validate()) {
      Get.toNamed(
        AppRoutes.verifyCode,
        arguments: {
          "viewType": ViewType.resetPassword,
        },
      );
    }
  }

  @override
  checkEmail(String email) {}

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
