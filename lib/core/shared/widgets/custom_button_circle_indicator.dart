import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButtonCircleIndicator extends StatelessWidget {
  const CustomButtonCircleIndicator({
    super.key,
    this.textColor = Colors.white,
  });

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 28,
          width: 28,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          'Please Wait...',
          style: AppTextStyle.textStyle16.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
