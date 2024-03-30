import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/features/language/controller/language_controller.dart';
import 'package:ecommerce_app/features/language/views/widgets/language_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LanguageViewBody extends GetView<LanguageControllerImpl> {
  const LanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppTranslationsKeys.languageTitle.tr,
            style: AppTextStyle.textStyle20,
          ),
          const SizedBox(height: 15),
          const LanguageList(),
          const SizedBox(height: 20),
          CustomButton(
            title: AppTranslationsKeys.languageButtonText.tr,
            horizontalPadding: 24,
            onPressed: () => Get.toNamed(AppRoutes.onBoarding),
          ),
        ],
      ),
    );
  }
}
