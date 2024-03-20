import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.horizontalPadding = 50,
  });

  final String title;
  final double horizontalPadding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: AppTextStyle.textStyle18.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
