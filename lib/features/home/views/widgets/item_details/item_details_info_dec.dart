import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/get_name_trans_func.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsInfoDec extends StatelessWidget {
  const ItemDetailsInfoDec({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTranslationsKeys.itemDetailsInfoProductInfo.tr,
          style: AppTextStyle.textStyle18,
        ),
        const SizedBox(height: 5),
        Text(
          getNameTrans(
            itemModel.itemsDecAr!,
            itemModel.itemsDec!,
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.textStyle16.copyWith(
            color: AppColors.customGrey2,
          ),
        ),
      ],
    );
  }
}
