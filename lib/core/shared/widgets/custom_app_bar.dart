import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.color = AppColors.primaryBackgroundColor,
  });

  final String? title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title ?? "",
                  style: AppTextStyle.textStyle20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
