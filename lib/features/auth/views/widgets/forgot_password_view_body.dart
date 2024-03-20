import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/valid_input_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/controller/forgot_password_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_body_auth.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordViewBody extends GetView<ForgotPasswordControllerImpl> {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: controller.formState,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 35),
            CustomTitleAuth(
              text: AppTranslationsKeys.forgotPasswordHeaderOne.tr,
            ),
            const SizedBox(height: 12),
            CustomBodyAuth(
              text: AppTranslationsKeys.forgotPasswordHeaderTwo.tr,
            ),
            const SizedBox(height: 65),
            CustomTextFormField(
              labelText: AppTranslationsKeys.forgotPasswordEmailLabel.tr,
              hintText: AppTranslationsKeys.forgotPasswordEmailHint.tr,
              iconData: Icons.email_outlined,
              controller: controller.email,
              validator: (val) => validInput(val!, 5, 100, InputType.email),
            ),
            const SizedBox(height: 25),
            CustomButton(
              title: AppTranslationsKeys.forgotPasswordButtonText.tr,
              onPressed: () => controller.goToVerifyCode(),
              horizontalPadding: 16,
            ),
          ],
        ),
      ),
    );
  }
}
