import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/cart/controller/mycart_controller.dart';
import 'package:ecommerce_app/features/cart/views/widgets/mycart_order_summary_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartOrderSummary extends StatelessWidget {
  const MyCartOrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, -0),
            blurStyle: BlurStyle.solid,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryBackgroundColor,
      ),
      child: GetBuilder<MyCartControllerImpl>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTranslationsKeys.myCartOrderSummary.tr,
                style: AppTextStyle.textStyle16,
              ),
              const SizedBox(height: 10),
              MyCartOrderSummaryItem(
                text1: AppTranslationsKeys.myCartSubTotal.tr,
                text2: "\$${controller.getSubTotal()}",
              ),
              MyCartOrderSummaryItem(
                text1: AppTranslationsKeys.myCartShippingFee.tr,
                text2: "Free",
                textColor: Colors.green,
              ),
              MyCartOrderSummaryItem(
                text1: AppTranslationsKeys.myCartDiscount.tr,
                text2: r"$0",
              ),
              const Divider(),
              const SizedBox(height: 5),
              MyCartOrderSummaryItem(
                text1: AppTranslationsKeys.myCartTotalPrice.tr,
                text2: "\$${controller.getTotal()}",
                textColor: AppColors.primaryColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
