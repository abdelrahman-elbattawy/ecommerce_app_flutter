import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/valid_input_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/controller/login_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_body_auth.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginHeaderSection extends GetView<LoginControllerImpl> {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitleAuth(
          text: AppTranslationsKeys.loginHeaderOne.tr,
        ),
        const SizedBox(height: 12),
        CustomBodyAuth(
          text: AppTranslationsKeys.loginHeadterTwo.tr,
        ),
        const SizedBox(height: 65),
        CustomTextFormField(
          labelText: AppTranslationsKeys.loginEmailLabel.tr,
          hintText: AppTranslationsKeys.loginEmailHint.tr,
          iconData: Icons.email_outlined,
          controller: controller.email,
          validator: (val) => validInput(val!, 5, 100, InputType.email),
        ),
        const SizedBox(height: 30),
        GetBuilder<LoginControllerImpl>(builder: (controller) {
          return CustomTextFormField(
            labelText: AppTranslationsKeys.loginPasswordLabel.tr,
            hintText: AppTranslationsKeys.loginPasswordHint.tr,
            iconData: Icons.lock_outlined,
            isSecure: controller.isHiddenPassword,
            controller: controller.password,
            validator: (val) => validInput(val!, 5, 30, InputType.password),
            onTapIcon: () => controller.showPassword(),
          );
        }),
      ],
    );
  }
}
