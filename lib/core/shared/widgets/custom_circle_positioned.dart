import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCirclePositioned extends StatelessWidget {
  const CustomCirclePositioned({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -100,
      top: -120,
      child: Container(
        height: MediaQuery.of(context).size.width * .6,
        width: MediaQuery.of(context).size.width * .6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * .6,
          ),
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
