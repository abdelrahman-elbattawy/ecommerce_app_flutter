import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemImageStackVertical extends StatelessWidget {
  const ItemImageStackVertical({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: MediaQuery.of(context).size.width * .36,
          width: MediaQuery.of(context).size.width * .32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryForegroundColor,
          ),
        ),
        Positioned.fill(
          child: Center(
            child: CachedNetworkImage(
              imageUrl:
                  "${AppServerLinks.imageItemsPath}/${itemModel.itemsImage}",
              height: MediaQuery.of(context).size.width * .28,
              width: MediaQuery.of(context).size.width * .22,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: getNameLang() == "EN" ? 10 : null,
          left: getNameLang() == "AR" ? 10 : null,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.primaryBackgroundColor,
            ),
            child: GetBuilder<HomeControllerImpl>(
              builder: (controller) {
                return IconButton(
                  onPressed: () => controller.setFavorite(itemModel),
                  icon: Icon(
                    itemModel.favID != "0"
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
