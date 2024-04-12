import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/shared/widgets/action_control_left.dart';
import 'package:ecommerce_app/core/shared/widgets/action_control_right.dart';
import 'package:flutter/material.dart';

class CustomActionControl extends StatelessWidget {
  const CustomActionControl({
    super.key,
    required this.titleButton,
    required this.textLabel,
    required this.textSpan1,
    required this.textSpan2,
    this.onTap,
  });

  final String titleButton;
  final String textLabel;
  final String textSpan1;
  final String textSpan2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * .16,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 36, right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryForegroundColor,
      ),
      child: Row(
        children: [
          ActionControlLeft(
            textLabel: textLabel,
            textSpan1: textSpan1,
            textSpan2: textSpan2,
          ),
          ActionControlRight(
            onTap: onTap,
            titleButton: titleButton,
          ),
        ],
      ),
    );
  }
}
