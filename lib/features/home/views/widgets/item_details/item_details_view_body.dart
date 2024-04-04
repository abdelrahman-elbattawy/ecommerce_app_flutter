import 'package:ecommerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/controller/item_details_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_information.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_slider_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsViewBody extends GetView<ItemDetailsControllerImpl> {
  const ItemDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const CustomAppBar(),
        ItemDetailsSliderImages(
          itemModel: controller.itemModel,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ItemDetailsInformation(
            itemModel: controller.itemModel,
          ),
        ),
      ],
    );
  }
}