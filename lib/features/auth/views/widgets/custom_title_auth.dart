import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  const CustomTitleAuth({
    super.key,
    required this.text,
    this.textStyle = AppTextStyle.textStyle28,
  });

  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: textStyle,
    );
  }
}
