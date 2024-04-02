import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/features/splash/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SplashViewBody(),
    );
  }
}
