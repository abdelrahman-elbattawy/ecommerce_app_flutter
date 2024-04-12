import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/get_name_trans_func.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_bottom_sheet_action_control.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_bottom_sheet_price_quantity.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_bottom_sheet_select_color.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_bottom_sheet_select_size.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_image_stack.dart';
import 'package:flutter/material.dart';

class ItemBottomSheetView extends StatelessWidget {
  const ItemBottomSheetView({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            const SizedBox(height: 10),
            CustomAppBar(
              title: getNameTrans(
                itemModel.itemsNameAr!,
                itemModel.itemsName!,
              ),
              color: Colors.transparent,
              textStyle: AppTextStyle.textStyle16,
            ),
            const SizedBox(height: 20),
            ItemImageStack(
              itemModel: itemModel,
              imageSize: .7,
              containerHeigth: .8,
              topBorderCircular: 24,
              bottomBorderCircular: 24,
              marginHorizontal: 24,
              visibleFavIcon: false,
            ),
            const SizedBox(height: 20),
            ItemBottomSheetPriceAndQuantity(
              priceAfter: itemModel.itemsPrice!,
              priceBefore: "1000",
            ),
            const SizedBox(height: 20),
            const ItemBottomSheetSelectColor(),
            const SizedBox(height: 20),
            const ItemBottomSheetSelectSize(),
          ],
        ),
        ItemBottomSheetActionControl(price: itemModel.itemsPrice!),
      ],
    );
  }
}
