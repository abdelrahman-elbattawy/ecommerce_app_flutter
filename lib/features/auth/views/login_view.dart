// import 'package:ecommerce_app/core/constants/app_colors.dart';
// import 'package:ecommerce_app/core/constants/app_text_style.dart';
// import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/auth/controller/login_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImpl());

    return Scaffold(
      appBar: AppBar(
          //   title: Text(
          //     AppTranslationsKeys.loginTitle.tr,
          //     style: AppTextStyle.textStyle26.copyWith(
          //       color: AppColors.customGrey.withAlpha(150),
          //     ),
          //   ),
          ),
      body: const LoginViewBody(),
    );
  }
}
