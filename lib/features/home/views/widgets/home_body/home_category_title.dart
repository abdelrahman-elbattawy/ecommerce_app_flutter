import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeCategoryTitle extends StatelessWidget {
  const HomeCategoryTitle({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  final String title;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: .2,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            isSelected
                ? const BoxShadow(
                    color: Colors.grey, //New
                    blurRadius: 5,
                    offset: Offset(0, -0),
                    blurStyle: BlurStyle.solid,
                  )
                : const BoxShadow(),
          ],
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.primaryBackgroundColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: AppTextStyle.textStyle16.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
