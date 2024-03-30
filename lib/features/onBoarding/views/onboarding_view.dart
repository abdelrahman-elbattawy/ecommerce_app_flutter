import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/features/onBoarding/controller/onboarding_controller.dart';
import 'package:ecommerce_app/features/onBoarding/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoadingView extends StatelessWidget {
  const OnBoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpl());
    final LocaleController localCont = Get.find();

    return Scaffold(
      body: Directionality(
        textDirection:
            localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
        child: const OnBoardingViewBody(),
      ),
    );
  }
}
