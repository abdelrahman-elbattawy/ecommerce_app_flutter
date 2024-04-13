import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/features/cart/views/widgets/mycart_coupon_code.dart';
import 'package:ecommerce_app/features/cart/views/widgets/mycart_order_summary.dart';
import 'package:ecommerce_app/features/cart/views/widgets/mycart_review_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const MyCartReviewOrder(),
        const MyCartCouponCode(),
        const MyCartOrderSummary(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: CustomButton(
            title: AppTranslationsKeys.myCartButtonCheckout.tr,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
