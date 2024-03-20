import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/features/auth/controller/verify_code_controller.dart';
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

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  signUp() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.find<VerifyCodeControllerImpl>().setViewType(ViewType.successSignUp);
      Get.toNamed(AppRoutes.verifyCode);
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
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.onClose();
  }
}
