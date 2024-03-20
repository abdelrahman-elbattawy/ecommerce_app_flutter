import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/valid_input_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_form_field.dart';
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
      children: [
        CustomTitleAuth(
          text: AppTranslationsKeys.registerHeaderOne.tr,
        ),
        const SizedBox(height: 12),
        CustomBodyAuth(text: AppTranslationsKeys.registerHeaderTwo.tr),
        const SizedBox(height: 65),
        CustomTextFormField(
          labelText: AppTranslationsKeys.registerUsernameLabel.tr,
          hintText: AppTranslationsKeys.registerUsernameHint.tr,
          iconData: Icons.lock_outlined,
          controller: controller.username,
          validator: (val) => validInput(val!, 5, 50, InputType.userName),
        ),
        const SizedBox(height: 30),
        CustomTextFormField(
          labelText: AppTranslationsKeys.registerEmailLabel.tr,
          hintText: AppTranslationsKeys.registerEmailHint.tr,
          iconData: Icons.email_outlined,
          controller: controller.email,
          validator: (val) => validInput(val!, 5, 100, InputType.email),
        ),
        const SizedBox(height: 30),
        CustomTextFormField(
          keyboardType: TextInputType.phone,
          labelText: AppTranslationsKeys.registerPhoneLabel.tr,
          hintText: AppTranslationsKeys.registerPhoneHint.tr,
          iconData: Icons.phone_outlined,
          controller: controller.phone,
          validator: (val) => validInput(val!, 5, 100, InputType.phone),
        ),
        const SizedBox(height: 30),
        GetBuilder<RegisterControllerImpl>(builder: (controller) {
          return CustomTextFormField(
            labelText: AppTranslationsKeys.registerPasswordLabel.tr,
            hintText: AppTranslationsKeys.registerPasswordHint.tr,
            iconData: Icons.lock_outlined,
            isSecure: controller.isHiddenPassword,
            controller: controller.password,
            validator: (val) => validInput(val!, 5, 100, InputType.password),
            onTapIcon: () => controller.showPassword(),
          );
        }),
      ],
    );
  }
}
