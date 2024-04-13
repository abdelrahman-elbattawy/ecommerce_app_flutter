import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/get_name_trans_func.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/core/shared/widgets/discount_text_label.dart';
import 'package:ecommerce_app/features/cart/views/widgets/mycart_card_quantity.dart';
import 'package:flutter/material.dart';

class MyCartCardInfo extends StatelessWidget {
  const MyCartCardInfo({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
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
          style: AppTextStyle.textStyle14.copyWith(
            color: AppColors.customGrey,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            DiscountTextLabel(
              priceBefore: "1000",
              priceAfter: itemModel.itemsPrice!,
              textSytleAfter: AppTextStyle.textStyle16,
              textSytleBefore: AppTextStyle.textStyle14,
            ),
            const Spacer(),
            MyCartCardQuantity(itemId: itemModel.itemsId!),
          ],
        ),
      ],
    );
  }
}
