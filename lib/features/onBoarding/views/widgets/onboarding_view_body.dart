import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/features/onBoarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_page_indicator.dart';
import 'package:ecommerce_app/features/onBoarding/views/widgets/onboarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingViewBody extends GetView<OnBoardingControllerImpl> {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 550,
              child: OnBoardingSlider(),
            ),
            GetBuilder<OnBoardingControllerImpl>(
              builder: (controler) {
                return CustomPageIndicator(
                  currentValue: controler.currentPage,
                );
              },
            ),
            const SizedBox(height: 200),
            CustomButton(
              title: AppTranslationsKeys.onBoardingButtonText.tr,
              onPressed: () => controller.next(),
            ),
          ],
        ),
      ),
    );
  }
}
