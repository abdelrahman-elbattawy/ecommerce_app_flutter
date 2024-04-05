import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemImageStack extends StatefulWidget {
  const ItemImageStack({
    super.key,
    required this.itemModel,
    required this.imageSize,
    this.containerHeigth = .35,
    this.marginHorizontal = 0,
    this.borderCircular = 16,
    this.favoriteLoc = 8,
  });

  final ItemModel itemModel;
  final double imageSize;
  final double containerHeigth;
  final double marginHorizontal;
  final double borderCircular;
  final double favoriteLoc;

  @override
  State<ItemImageStack> createState() => _ItemImageStackState();
}

class _ItemImageStackState extends State<ItemImageStack> {
  IconData favoriteIcon = Icons.favorite_outline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: widget.marginHorizontal),
          height: MediaQuery.of(context).size.width * widget.containerHeigth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderCircular),
            color: AppColors.primaryForegroundColor,
          ),
        ),
        Positioned(
          child: CachedNetworkImage(
            imageUrl:
                "${AppServerLinks.imageItemsPath}/${widget.itemModel.itemsImage}",
            height: MediaQuery.of(context).size.width * widget.imageSize,
            width: MediaQuery.of(context).size.width * widget.imageSize,
          ),
        ),
        Positioned(
          top: 10,
          right: getNameLang() == "EN" ? widget.favoriteLoc : null,
          left: getNameLang() == "AR" ? widget.favoriteLoc : null,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.primaryBackgroundColor,
            ),
            child: IconButton(
              onPressed: () => setState(
                () => favoriteIcon == Icons.favorite_outline
                    ? favoriteIcon = Icons.favorite
                    : favoriteIcon = Icons.favorite_outline,
              ),
              icon: Icon(
                favoriteIcon,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
