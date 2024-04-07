import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/get_name_trans_func.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemCardInfoVertical extends StatelessWidget {
  const ItemCardInfoVertical({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            getNameTrans(
              itemModel.itemsNameAr!,
              itemModel.itemsName!,
            ),
            maxLines: 2,
            style: AppTextStyle.textStyle16,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            getNameTrans(
              itemModel.categoryModel!.categoriesNameAr!,
              itemModel.categoryModel!.categoriesName!,
            ),
            maxLines: 1,
            style: AppTextStyle.textStyle16.copyWith(
              color: AppColors.customGrey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            getNameTrans(
              itemModel.itemsDecAr!,
              itemModel.itemsDec!,
            ),
            maxLines: 2,
            style: AppTextStyle.textStyle14.copyWith(
              color: AppColors.customGrey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            r"$ " + itemModel.itemsPrice!,
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
