import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.customGrey.withAlpha(15),
        child: IconButton(
          onPressed: () {},
          icon: Image.asset(
            image,
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
