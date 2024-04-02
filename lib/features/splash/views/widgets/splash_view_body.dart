import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/features/splash/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingText(
          text: 'Ecommerce App',
          textStyle: AppTextStyle.textStyle26,
          isLeft: true,
        ),
        SizedBox(
          height: 4,
        ),
        SlidingText(
          text: 'Shop Product Free',
          textStyle: AppTextStyle.textStyle16,
          isRigth: true,
        ),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(AppRoutes.language),
    );
  }
}
