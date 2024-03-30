import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.titleText,
    required this.leadingIconData,
    this.trailingIconData = Icons.arrow_forward_ios,
    this.onTap,
    this.backgroundColor = AppColors.primaryBackgroundColor,
    this.titleColor = Colors.black,
    this.iconColor = Colors.black,
  });

  final String titleText;
  final IconData leadingIconData;
  final IconData trailingIconData;
  final Function()? onTap;
  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 5,
              offset: const Offset(0, -0),
              blurStyle: BlurStyle.solid,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor,
        ),
        child: ListTile(
          leading: Icon(leadingIconData, color: iconColor),
          title: Text(
            titleText,
            style: AppTextStyle.textStyle16.copyWith(
              fontWeight: FontWeight.normal,
              color: titleColor,
            ),
          ),
          trailing: Icon(trailingIconData, size: 16, color: iconColor),
        ),
      ),
    );
  }
}
