import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/datasources/static_data.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_circle_positioned.dart';
import 'package:ecommerce_app/features/onBoarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_page_indicator.dart';
import 'package:ecommerce_app/features/onBoarding/views/widgets/onboarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingViewBody extends GetView<OnBoardingControllerImpl> {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomCirclePositioned(),
        ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 1.2,
              child: const OnBoardingSlider(),
            ),
            GetBuilder<OnBoardingControllerImpl>(
              builder: (controler) {
                return CustomPageIndicator(
                  listLength: onBoardingList.length,
                  currentValue: controler.currentPage,
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.width * .25),
            CustomButton(
              title: AppTranslationsKeys.onBoardingButtonText.tr,
              onPressed: () => controller.next(),
            ),
          ],
        ),
      ],
    );
  }
}
