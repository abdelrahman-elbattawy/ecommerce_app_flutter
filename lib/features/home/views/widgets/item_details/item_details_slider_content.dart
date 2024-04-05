import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemDetailsSliderContent extends StatelessWidget {
  const ItemDetailsSliderContent({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: AppColors.primaryForegroundColor,
          ),
        ),
        Hero(
          tag: itemModel.itemsId!,
          child: CachedNetworkImage(
            imageUrl:
                "${AppServerLinks.imageItemsPath}/${itemModel.itemsImage}",
            height: MediaQuery.of(context).size.width * .75,
            width: MediaQuery.of(context).size.width * .75,
          ),
        ),
      ],
    );
  }
}
