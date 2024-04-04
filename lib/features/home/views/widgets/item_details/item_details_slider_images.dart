import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/features/home/controller/item_details_controller.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_image_indicator.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_slider_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsSliderImages extends GetView<ItemDetailsControllerImpl> {
  const ItemDetailsSliderImages({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width,
          child: PageView.builder(
            onPageChanged: (index) => controller.onSliderChanged(index),
            itemCount: 3,
            itemBuilder: (context, index) => ItemDetailsSliderContent(
              itemModel: itemModel,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: getNameLang() == "EN" ? 50 : null,
          left: getNameLang() == "AR" ? 50 : null,
          child: GetBuilder<ItemDetailsControllerImpl>(
            builder: (controller) {
              return ItemDetailsImageIndicator(
                listLength: controller.imagesPath.length,
                currentValue: controller.currentSlider,
              );
            },
          ),
        ),
      ],
    );
  }
}
