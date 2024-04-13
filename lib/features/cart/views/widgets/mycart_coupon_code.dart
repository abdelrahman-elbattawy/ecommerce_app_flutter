import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartCouponCode extends StatelessWidget {
  const MyCartCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            AppTranslationsKeys.myCartYourCouponCode.tr,
            style: AppTextStyle.textStyle16,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: AppTranslationsKeys.myCartTypeCouponCode.tr,
            prefixIcon: Icons.redeem,
          ),
        ],
      ),
    );
  }
}
