import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_click.dart';
import 'package:ecommerce_app/features/auth/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFooterSection extends GetView<RegisterControllerImpl> {
  const RegisterFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        GetBuilder<RegisterControllerImpl>(
          builder: (controller) {
            return CustomButton(
              isLoading: controller.isLoading,
              title: AppTranslationsKeys.registerButtonText.tr,
              onPressed: () => controller.signUp(),
              horizontalPadding: 16,
            );
          },
        ),
        const SizedBox(height: 30),
        CustomTextClick(
          text: AppTranslationsKeys.registerHaveAccount.tr,
          textClick: AppTranslationsKeys.registerSignInLabel.tr,
          onTap: () => controller.goToLogin(),
        ),
      ],
    );
  }
}
