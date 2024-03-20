import 'package:ecommerce_app/core/constants/app_routes.dart';
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

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    formState = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  showPassword() {
    isHiddenPassword = isHiddenPassword ? false : true;
    update();
  }

  @override
  login() {
    var formData = formState.currentState;

    if (formData!.validate()) {}
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
