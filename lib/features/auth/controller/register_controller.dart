import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
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

  late final AuthRepoImpl _authRepoImpl;

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      var results = await _authRepoImpl.registerWithData(
        username.text,
        password.text,
        email.text,
        phone.text,
      );

      results.fold(
        (failure) => CustomSnakBar.showSnack(
          context: Get.context!,
          snackBarType: SnackBarType.error,
          errMessage: failure.errMessage,
        ),
        (data) {
          // Get.find<VerifyCodeControllerImpl>()
          //     .setViewType(ViewType.successSignUp);
          // Get.toNamed(AppRoutes.verifyCode);
          CustomSnakBar.showSnack(
            context: Get.context!,
            snackBarType: SnackBarType.success,
            errMessage: "Sigin up successfully!",
          );
        },
      );
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

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.onClose();
  }
}
