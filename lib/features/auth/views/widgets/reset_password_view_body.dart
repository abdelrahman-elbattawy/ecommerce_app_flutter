import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/valid_input_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_circle_positioned.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_form_field_2.dart';
import 'package:ecommerce_app/features/auth/controller/reset_password_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_body_auth.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordViewBody extends GetView<ResetPasswordControllerImpl> {
  const ResetPasswordViewBody({super.key});

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
                  text: AppTranslationsKeys.resetPasswordHeaderOne.tr,
                ),
                const SizedBox(height: 12),
                CustomBodyAuth(
                  text: AppTranslationsKeys.resetPasswordHeaderTwo.tr,
                ),
                const SizedBox(height: 50),
                GetBuilder<ResetPasswordControllerImpl>(builder: (controller) {
                  return CustomTextFormField2(
                    // labelText: AppTranslationsKeys.resetPasswordPassLabel.tr,
                    hintText: AppTranslationsKeys.resetPasswordPassHint.tr,
                    prefixIconData: Icons.lock,
                    suffixIconData: controller.isHiddenPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    isSecure: controller.isHiddenPassword,
                    controller: controller.password,
                    validator: (val) =>
                        validInput(val!, 5, 30, InputType.password),
                    onTapSuffix: () => controller.showPassword(),
                    onTapPrefix: () {},
                  );
                }),
                const SizedBox(height: 25),
                GetBuilder<ResetPasswordControllerImpl>(builder: (controller) {
                  return CustomTextFormField2(
                    // labelText: AppTranslationsKeys.resetRePasswordPassLabel.tr,
                    hintText: AppTranslationsKeys.resetRePasswordPassHint.tr,
                    prefixIconData: Icons.lock,
                    suffixIconData: controller.isHiddenPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    isSecure: controller.isHiddenRePassword,
                    controller: controller.rePassword,
                    validator: (val) {
                      if (val != controller.password.text) {
                        return AppTranslationsKeys.passwordMatchValid.tr;
                      }
                      return validInput(val!, 5, 30, InputType.password);
                    },
                    onTapSuffix: () => controller.showRePassword(),
                    onTapPrefix: () {},
                  );
                }),
                const SizedBox(height: 25),
                GetBuilder<ResetPasswordControllerImpl>(builder: (controller) {
                  return CustomButton(
                    isLoading: controller.isLoading,
                    title: AppTranslationsKeys.resetPasswordButtonText.tr,
                    onPressed: () => controller.savePassword(),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
