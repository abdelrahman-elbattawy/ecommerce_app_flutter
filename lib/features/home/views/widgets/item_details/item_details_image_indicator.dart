import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ItemDetailsImageIndicator extends StatelessWidget {
  const ItemDetailsImageIndicator({
    super.key,
    required this.listLength,
    required this.currentValue,
  });

  final int listLength;
  final int currentValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 25,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          listLength,
          (index) => AnimatedContainer(
            height: 8,
            width: 8,
            duration: const Duration(microseconds: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              color: index == currentValue
                  ? const Color(0xFFFFFFFF)
                  : AppColors.customGrey2,
            ),
          ),
        ),
      ),
    );
  }
}
