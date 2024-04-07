import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemImageStack extends StatelessWidget {
  const ItemImageStack({
    super.key,
    required this.itemModel,
    required this.imageSize,
    this.containerHeigth = .35,
    this.marginHorizontal = 0,
    this.borderCircular = 16,
    this.favoriteLoc = 8,
    this.visibleFavIcon = true,
    this.onPressed,
  });

  final ItemModel itemModel;
  final double imageSize;
  final double containerHeigth;
  final double marginHorizontal;
  final double borderCircular;
  final double favoriteLoc;
  final bool visibleFavIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
          height: MediaQuery.of(context).size.width * containerHeigth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderCircular),
              topRight: Radius.circular(borderCircular),
            ),
            color: AppColors.primaryForegroundColor,
          ),
        ),
        Positioned(
          bottom: 0,
          child: CachedNetworkImage(
            imageUrl:
                "${AppServerLinks.imageItemsPath}/${itemModel.itemsImage}",
            height: MediaQuery.of(context).size.width * imageSize,
            width: MediaQuery.of(context).size.width * imageSize * .8,
            fit: BoxFit.fill,
          ),
        ),
        Visibility(
          visible: visibleFavIcon,
          child: Positioned(
            top: 10,
            right: getNameLang() == "EN" ? favoriteLoc : null,
            left: getNameLang() == "AR" ? favoriteLoc : null,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.primaryBackgroundColor,
              ),
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  itemModel.favID != "0"
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
