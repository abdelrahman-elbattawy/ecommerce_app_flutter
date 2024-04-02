import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/valid_input_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_circle_positioned.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_form_field_2.dart';
import 'package:ecommerce_app/features/auth/controller/forgot_password_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_body_auth.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordViewBody extends GetView<ForgotPasswordControllerImpl> {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomCirclePositioned(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: controller.formState,
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.width * .4),
                CustomTitleAuth(
                  text: AppTranslationsKeys.forgotPasswordHeaderOne.tr,
                ),
                const SizedBox(height: 12),
                CustomBodyAuth(
                  text: AppTranslationsKeys.forgotPasswordHeaderTwo.tr,
                ),
                const SizedBox(height: 50),
                CustomTextFormField2(
                  // labelText: AppTranslationsKeys.forgotPasswordEmailLabel.tr,
                  hintText: AppTranslationsKeys.forgotPasswordEmailHint.tr,
                  prefixIconData: Icons.email,
                  controller: controller.email,
                  validator: (val) => validInput(val!, 5, 100, InputType.email),
                  onTapPrefix: () {},
                  onTapSuffix: () {},
                ),
                const SizedBox(height: 25),
                GetBuilder<ForgotPasswordControllerImpl>(
                  builder: (controller) {
                    return CustomButton(
                      isLoading: controller.isLoading,
                      title: AppTranslationsKeys.forgotPasswordButtonText.tr,
                      onPressed: () => controller.checkEmail(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
