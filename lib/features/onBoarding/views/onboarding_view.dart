import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/features/onBoarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/features/onBoarding/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoadingView extends StatelessWidget {
  const OnBoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpl());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: getTextDirection(),
        child: const OnBoardingViewBody(),
      ),
    );
  }
}
