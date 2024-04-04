import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    super.key,
    required this.title,
    required this.buttonText,
    this.onPressed,
  });

  final String title;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.textStyle20,
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
            ),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: AppTextStyle.textStyle16,
            ),
          ),
        ],
      ),
    );
  }
}
