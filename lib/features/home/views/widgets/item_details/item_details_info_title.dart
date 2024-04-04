import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/get_name_trans_func.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemDetailsInfoTitle extends StatelessWidget {
  const ItemDetailsInfoTitle({
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
          getNameTrans(
            itemModel.categoryModel!.categoriesNameAr!,
            itemModel.categoryModel!.categoriesName!,
          ),
          style: AppTextStyle.textStyle18.copyWith(
            color: AppColors.customGrey2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          getNameTrans(
            itemModel.itemsNameAr!,
            itemModel.itemsName!,
          ),
          maxLines: 2,
          style: AppTextStyle.textStyle20,
        ),
      ],
    );
  }
}
