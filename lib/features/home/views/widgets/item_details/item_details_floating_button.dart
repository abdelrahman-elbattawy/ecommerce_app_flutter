import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_action_control.dart';
import 'package:ecommerce_app/features/home/controller/item_details_controller.dart';
import 'package:ecommerce_app/features/home/views/item_bottom_sheet_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsFloatingButton extends GetView<ItemDetailsControllerImpl> {
  const ItemDetailsFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomActionControl(
      titleButton: AppTranslationsKeys.itemDetailsInfoBuyNow.tr,
      textLabel: AppTranslationsKeys.itemDetailsInfoUnitPrice.tr,
      textSpan1: controller.itemModel.itemsPrice!,
      textSpan2: "1000",
      onTap: () => showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (builder) => Directionality(
          textDirection: getTextDirection(),
          child: ItemBottomSheetView(
            itemModel: controller.itemModel,
          ),
        ),
      ),
    );
  }
}
