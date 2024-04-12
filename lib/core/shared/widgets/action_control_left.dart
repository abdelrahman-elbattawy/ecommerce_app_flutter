import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/core/shared/widgets/discount_text_label.dart';
import 'package:flutter/material.dart';

class ActionControlLeft extends StatelessWidget {
  const ActionControlLeft({
    super.key,
    required this.textLabel,
    required this.textSpan1,
    required this.textSpan2,
  });

  final String textLabel;
  final String textSpan1;
  final String textSpan2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: getNameLang() == "AR"
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            DiscountTextLabel(
              priceAfter: textSpan1,
              priceBefore: textSpan2,
            ),
            Text(
              textLabel,
              style: AppTextStyle.textStyle14.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
