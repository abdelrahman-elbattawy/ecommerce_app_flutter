import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_action_control.dart';
import 'package:ecommerce_app/features/home/controller/bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBottomSheetActionControl extends GetView<BottomSheetControllerImpl> {
  const ItemBottomSheetActionControl({
    super.key,
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, 0.9),
      child: GetBuilder<BottomSheetControllerImpl>(
        builder: (context) {
          return CustomActionControl(
            titleButton: AppTranslationsKeys.bottomSheetAddToCartButton.tr,
            textLabel: AppTranslationsKeys.bottomSheetTotalPriceLabel.tr,
            textSpan1: controller.getTotalPrice(price),
            textSpan2: "",
          );
        },
      ),
    );
  }
}
