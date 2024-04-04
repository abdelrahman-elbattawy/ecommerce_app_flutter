import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsInfoRating extends StatelessWidget {
  const ItemDetailsInfoRating({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: itemModel.itemsCount == "0"
                ? Colors.red
                : const Color(0xFF2BD76E),
          ),
          onPressed: () {},
          child: Text(
            itemModel.itemsCount == "0"
                ? AppTranslationsKeys.itemDetailsInfoNotAvailableStock.tr
                : AppTranslationsKeys.itemDetailsInfoAvailableStock.tr,
            style: AppTextStyle.textStyle14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
        const Icon(Icons.star, color: Colors.yellow),
        const Text(
          "4.4",
          style: AppTextStyle.textStyle18,
        ),
        Text(
          "(126 ${AppTranslationsKeys.itemDetailsInfoReviews.tr})",
          style: AppTextStyle.textStyle12.copyWith(
            color: AppColors.customGrey2,
          ),
        ),
      ],
    );
  }
}
