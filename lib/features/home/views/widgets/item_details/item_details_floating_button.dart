import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/features/home/controller/item_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsFloatingButton extends GetView<ItemDetailsControllerImpl> {
  const ItemDetailsFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * .16,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 36, right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryForegroundColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 24),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: getNameLang() == "AR"
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    r"$" + controller.itemModel.itemsPrice!,
                    style: AppTextStyle.textStyle16.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    AppTranslationsKeys.itemDetailsInfoUnitPrice.tr,
                    style: AppTextStyle.textStyle14.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.width * .16,
                margin: const EdgeInsets.only(left: 40),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    AppTranslationsKeys.itemDetailsInfoBuyNow.tr,
                    style: AppTextStyle.textStyle16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
