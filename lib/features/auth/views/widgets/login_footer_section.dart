import 'package:ecommerce_app/core/constants/app_assets_images.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_circle_avatar.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_click.dart';
import 'package:ecommerce_app/features/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginFooterSection extends GetView<LoginControllerImpl> {
  const LoginFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: AppColors.primaryColor,
              value: true,
              onChanged: (val) {},
            ),
            Text(
              AppTranslationsKeys.loginRememberMe.tr,
              style: AppTextStyle.textStyle16.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => controller.goToForgotPassword(),
              child: Text(
                AppTranslationsKeys.loginForgotPassword.tr,
                style: AppTextStyle.textStyle16.copyWith(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        GetBuilder<LoginControllerImpl>(builder: (controller) {
          return CustomButton(
            isLoading: controller.isLoading,
            title: AppTranslationsKeys.loginButtonText.tr,
            onPressed: () => controller.login(),
            horizontalPadding: 16,
          );
        }),
        const SizedBox(height: 60),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCircleAvatar(image: AppAssetsImages.googleIcon),
            CustomCircleAvatar(image: AppAssetsImages.appleIcon),
            CustomCircleAvatar(image: AppAssetsImages.facebookIcon),
          ],
        ),
        const SizedBox(height: 25),
        CustomTextClick(
          text: AppTranslationsKeys.loginDontHaveAccount.tr,
          textClick: AppTranslationsKeys.loginSignUpLabel.tr,
          onTap: () => controller.goToRegisterView(),
        ),
      ],
    );
  }
}
