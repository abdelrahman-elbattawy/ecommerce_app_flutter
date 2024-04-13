import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class MyCartOrderSummaryItem extends StatelessWidget {
  const MyCartOrderSummaryItem({
    super.key,
    required this.text1,
    required this.text2,
    this.textColor = Colors.black,
  });

  final String text1;
  final String text2;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            text1,
            style: AppTextStyle.textStyle16.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          const Spacer(),
          Text(
            text2,
            style: AppTextStyle.textStyle16.copyWith(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
