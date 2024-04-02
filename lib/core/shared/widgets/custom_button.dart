import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button_circle_indicator.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
  });

  final String title;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .125,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: !isLoading
            ? Text(
                title,
                style: AppTextStyle.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              )
            : const CustomButtonCircleIndicator(),
      ),
    );
  }
}
