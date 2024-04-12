import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/features/favorite/controller/favorite_controller.dart';
import 'package:ecommerce_app/features/home/controller/item_details_controller.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_image_stack.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_image_indicator.dart';
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
            itemBuilder: (context, index) => ItemImageStack(
              itemModel: itemModel,
              imageSize: .75,
              containerHeigth: 1,
              topBorderCircular: 0,
              marginHorizontal: 0,
              visibleFavIcon: false,
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
        Positioned(
          left: getNameLang() == "EN" ? 10 : null,
          right: getNameLang() == "AR" ? 10 : null,
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        Positioned(
          top: 10,
          right: getNameLang() == "EN" ? 30 : null,
          left: getNameLang() == "AR" ? 30 : null,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.primaryBackgroundColor,
            ),
            child: GetBuilder<ItemDetailsControllerImpl>(
              builder: (controller) {
                return IconButton(
                  onPressed: () => controller.setFavorite(itemModel),
                  icon: Icon(
                    Get.find<FavoriteControllerImpl>().isFavorite(itemModel)
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
