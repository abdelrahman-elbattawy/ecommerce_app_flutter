import 'package:ecommerce_app/core/constants/app_assets_images.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/features/success/controller/success_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessViewBody extends GetView<SuccessControllerImpl> {
  const SuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssetsImages.successLogo),
        Text(
          controller.textLabel,
          style: AppTextStyle.textStyle18.copyWith(
            color: AppColors.customGrey.withAlpha(200),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppTranslationsKeys.successViewLabel.tr,
          style: AppTextStyle.textStyle20,
        ),
        const SizedBox(height: 30),
        CustomButton(
          title: AppTranslationsKeys.successViewButtonText.tr,
          onPressed: () => controller.goToHomePage(),
        ),
      ],
    );
  }
}
