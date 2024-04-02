import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  const CustomBodyAuth({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: AppTextStyle.textStyle16.copyWith(
        color: AppColors.customGrey.withAlpha(150),
      ),
    );
  }
}
