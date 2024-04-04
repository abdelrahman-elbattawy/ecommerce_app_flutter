import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        const Spacer(),
        Text(
          title ?? "",
          style: AppTextStyle.textStyle20,
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
