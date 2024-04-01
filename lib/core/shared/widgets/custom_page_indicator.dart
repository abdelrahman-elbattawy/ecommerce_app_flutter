import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.currentValue,
    required this.listLength,
  });

  final int listLength;
  final int currentValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        listLength,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedContainer(
            width: index == currentValue ? 35 : 10,
            height: 10,
            duration: const Duration(microseconds: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: index == currentValue
                  ? AppColors.primaryColor
                  : Colors.grey[350],
            ),
          ),
        ),
      ),
    );
  }
}
