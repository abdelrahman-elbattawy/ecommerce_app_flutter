import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.primaryColor,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: color,
                ),
              ),
              const Icon(
                Icons.check,
                color: Colors.white,
                size: 28,
              ),
            ],
          )
        : CircleAvatar(
            radius: 22,
            backgroundColor: color,
          );
  }
}
