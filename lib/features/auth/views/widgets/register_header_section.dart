import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/valid_input_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_form_field_2.dart';
import 'package:ecommerce_app/features/auth/controller/register_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_body_auth.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterHeaderSection extends GetView<RegisterControllerImpl> {
  const RegisterHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleAuth(
          text: AppTranslationsKeys.registerHeaderOne.tr,
        ),
        const SizedBox(height: 12),
        CustomBodyAuth(text: AppTranslationsKeys.registerHeaderTwo.tr),
        const SizedBox(height: 40),
        CustomTextFormField2(
          // labelText: AppTranslationsKeys.registerUsernameLabel.tr,
          hintText: AppTranslationsKeys.registerUsernameHint.tr,
          prefixIconData: Icons.person_2,
          controller: controller.username,
          validator: (val) => validInput(val!, 5, 50, InputType.userName),
          isSuffixIcon: false,
          onTapPrefix: () {},
        ),
        const SizedBox(height: 20),
        CustomTextFormField2(
          // labelText: AppTranslationsKeys.registerEmailLabel.tr,
          hintText: AppTranslationsKeys.registerEmailHint.tr,
          prefixIconData: Icons.email,
          controller: controller.email,
          validator: (val) => validInput(val!, 5, 100, InputType.email),
          isSuffixIcon: false,
          onTapPrefix: () {},
        ),
        const SizedBox(height: 20),
        CustomTextFormField2(
          keyboardType: TextInputType.phone,
          // labelText: AppTranslationsKeys.registerPhoneLabel.tr,
          hintText: AppTranslationsKeys.registerPhoneHint.tr,
          prefixIconData: Icons.phone,
          controller: controller.phone,
          validator: (val) => validInput(val!, 5, 100, InputType.phone),
          isSuffixIcon: false,
          onTapPrefix: () {},
        ),
        const SizedBox(height: 20),
        GetBuilder<RegisterControllerImpl>(builder: (controller) {
          return CustomTextFormField2(
            // labelText: AppTranslationsKeys.registerPasswordLabel.tr,
            hintText: AppTranslationsKeys.registerPasswordHint.tr,
            prefixIconData: Icons.lock,
            isSecure: controller.isHiddenPassword,
            controller: controller.password,
            validator: (val) => validInput(val!, 5, 100, InputType.password),
            onTapSuffix: () => controller.showPassword(),
            onTapPrefix: () {},
            suffixIconData: controller.isHiddenPassword
                ? Icons.visibility_off
                : Icons.visibility,
          );
        }),
      ],
    );
  }
}
