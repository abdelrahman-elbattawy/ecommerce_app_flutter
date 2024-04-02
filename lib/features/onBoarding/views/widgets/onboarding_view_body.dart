import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/datasources/static_data.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_circle_positioned.dart';
import 'package:ecommerce_app/features/onBoarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_page_indicator.dart';
import 'package:ecommerce_app/features/onBoarding/views/widgets/onboarding_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingViewBody extends GetView<OnBoardingControllerImpl> {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomCirclePositioned(),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (value) => controller.onPageChanged(value),
                itemCount: onBoardingList.length,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: onBoardingList[index].image!,
                  title: onBoardingList[index].title!,
                  body: onBoardingList[index].body!,
                ),
              ),
            ),
            GetBuilder<OnBoardingControllerImpl>(
              builder: (controler) {
                return CustomPageIndicator(
                  listLength: onBoardingList.length,
                  currentValue: controler.currentPage,
                );
              },
            ),
            const Spacer(),
            CustomButton(
              title: AppTranslationsKeys.onBoardingButtonText.tr,
              onPressed: () => controller.next(),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
