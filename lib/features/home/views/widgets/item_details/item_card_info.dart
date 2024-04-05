import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/core/functions/get_name_trans_func.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemCardInfo extends StatelessWidget {
  const ItemCardInfo({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: getNameLang() == "EN"
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            getNameTrans(
              itemModel.itemsNameAr!,
              itemModel.itemsName!,
            ),
            maxLines: 1,
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
          Text(
            r"$ " + itemModel.itemsPrice!,
            style: AppTextStyle.textStyle16,
          ),
        ],
      ),
    );
  }
}
