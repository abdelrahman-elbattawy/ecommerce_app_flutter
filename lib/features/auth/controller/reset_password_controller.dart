import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/success/controller/success_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  savePassword(String password);
  goToSuccessReset();
  showPassword();
  showRePassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  late GlobalKey<FormState> formState;

  bool isHiddenPassword = true;
  bool isHiddenRePassword = true;

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    formState = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  goToSuccessReset() {
    var formData = formState.currentState;

    if (formData!.validate()) {
      Get.find<SuccessControllerImpl>()
          .setSuccessLabel(AppTranslationsKeys.successViewText1.tr);
      Get.offNamed(AppRoutes.successView);
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

  @override
  savePassword(String password) {}

  @override
  void onClose() {
    password.dispose();
    rePassword.dispose();

    super.onClose();
  }
}
