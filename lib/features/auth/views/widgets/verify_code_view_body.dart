import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_click.dart';
import 'package:ecommerce_app/features/auth/controller/verify_code_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_body_auth.dart';
import 'package:ecommerce_app/features/auth/views/widgets/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeViewBody extends GetView<VerifyCodeControllerImpl> {
  const VerifyCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put((VerifyCodeControllerImpl));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 35),
          CustomTitleAuth(
            text: AppTranslationsKeys.verifyCodeHeaderOne.tr,
          ),
          const SizedBox(height: 12),
          CustomBodyAuth(
            text:
                "${AppTranslationsKeys.verifyCodeHeaderTwo.tr} ${controller.email}",
          ),
          const SizedBox(height: 40),
          OtpTextField(
            fieldWidth: 60,
            borderRadius: BorderRadius.circular(12),
            numberOfFields: 5,
            borderColor: AppColors.primaryColor,
            focusedBorderColor: AppColors.primaryColor,
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              controller.verifyCode = verificationCode;
              controller.goToCustomView();
            },
          ),
          const SizedBox(height: 25),
          GetBuilder<VerifyCodeControllerImpl>(
            builder: (controller) {
              return CustomButton(
                isLoading: controller.isLoading,
                title: AppTranslationsKeys.verifyCodeButtonText.tr,
                onPressed: () => controller.goToCustomView(),
                horizontalPadding: 16,
              );
            },
          ),
          const SizedBox(height: 30),
          CustomTextClick(
            text: AppTranslationsKeys.verifyCodeDontReceive.tr,
            textClick: "${AppTranslationsKeys.verifyCodeResendLabel.tr}(60)",
            onTap: () => controller.resendCodeAgain(""),
          ),
        ],
      ),
    );
  }
}
