import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_icon_button.dart';
import 'package:ecommerce_app/core/shared/widgets/discount_text_label.dart';
import 'package:ecommerce_app/features/home/controller/bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBottomSheetPriceAndQuantity extends StatelessWidget {
  const ItemBottomSheetPriceAndQuantity({
    super.key,
    required this.priceAfter,
    required this.priceBefore,
  });

  final String priceAfter;
  final String priceBefore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppTranslationsKeys.itemDetailsInfoUnitPrice.tr,
                style: AppTextStyle.textStyle16.copyWith(
                  color: Colors.black,
                ),
              ),
              const Spacer(flex: 3),
              Text(
                AppTranslationsKeys.bottomSheetQuantityLabel.tr,
                style: AppTextStyle.textStyle16.copyWith(
                  color: Colors.black,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 5),
          GetBuilder<BottomSheetControllerImpl>(
            builder: (controller) {
              return Row(
                children: [
                  DiscountTextLabel(
                    priceAfter: priceAfter,
                    textSytleAfter: AppTextStyle.textStyle18,
                    priceBefore: priceBefore,
                    textSytleBefore: AppTextStyle.textStyle16,
                  ),
                  const Spacer(),
                  CustomIconButton(
                    onPressed: () => controller.removeItem(),
                    iconData: Icons.remove,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    controller.itemQuantity.toString(),
                    style: AppTextStyle.textStyle20,
                  ),
                  const SizedBox(width: 10),
                  CustomIconButton(
                    onPressed: () => controller.addItem(),
                    iconData: Icons.add,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
