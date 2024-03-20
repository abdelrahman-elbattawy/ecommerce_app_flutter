import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/features/onBoarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/shared/datasources/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSlider extends GetView<OnBoardingControllerImpl> {
  const OnBoardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) => controller.onPageChanged(value),
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 20),
              Text(
                onBoardingList[index].title!.tr,
                style: AppTextStyle.textStyle20,
              ),
              const SizedBox(height: 80),
              Image.asset(
                onBoardingList[index].image!,
                height: 250,
                width: 200,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 40),
              Text(
                onBoardingList[index].body!.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyle18.copyWith(
                  color: AppColors.customGrey,
                  height: 2,
                ),
              ),
            ],
          );
        });
  }
}
