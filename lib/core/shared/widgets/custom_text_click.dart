import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:flutter/material.dart';

class CustomTextClick extends StatelessWidget {
  const CustomTextClick({
    super.key,
    required this.text,
    required this.textClick,
    this.onTap,
  });

  final String text;
  final String textClick;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: getTextDirection(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyle.textStyle16.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.customGrey.withAlpha(150),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              textClick,
              style: AppTextStyle.textStyle16.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
