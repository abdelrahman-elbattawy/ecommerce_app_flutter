import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/shared/widgets/page_loading_indicator.dart';
import 'package:ecommerce_app/features/home/controller/item_details_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_information.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_slider_images.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_similar_items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsControllerImpl>(
      builder: (controller) {
        return controller.isLoading
            ? const PageLoadingIndicator()
            : ListView(
                padding: EdgeInsets.zero,
                children: [
                  ItemDetailsSliderImages(
                    itemModel: controller.itemModel,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ItemDetailsInformation(
                      itemModel: controller.itemModel,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "You may also like",
                      style: AppTextStyle.textStyle18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ItemSimilarItemsList(),
                  ),
                ],
              );
      },
    );
  }
}
