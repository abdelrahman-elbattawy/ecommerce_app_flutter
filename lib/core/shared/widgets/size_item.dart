import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({
    super.key,
    required this.isSelected,
    required this.text,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 1,
          color: isSelected ? AppColors.primaryColor : Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.textStyle16.copyWith(
            color: isSelected ? AppColors.primaryColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
