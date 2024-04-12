import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class DiscountTextLabel extends StatelessWidget {
  const DiscountTextLabel({
    super.key,
    required this.priceBefore,
    required this.priceAfter,
    this.textSytleBefore = AppTextStyle.textStyle12,
    this.textSytleAfter = AppTextStyle.textStyle16,
  });

  final String priceBefore;
  final String priceAfter;
  final TextStyle textSytleBefore;
  final TextStyle textSytleAfter;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: r"$" + priceAfter,
            style: textSytleAfter.copyWith(
              color: Colors.black,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(width: 5),
          ),
          TextSpan(
            text: priceBefore.isEmpty ? null : r"$" + priceBefore,
            style: textSytleBefore.copyWith(
              color: AppColors.customGrey2,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
