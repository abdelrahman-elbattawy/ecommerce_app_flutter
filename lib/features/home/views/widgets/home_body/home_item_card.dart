import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/get_name_trans_func.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:flutter/material.dart';

class HomeItemCard extends StatefulWidget {
  const HomeItemCard({
    super.key,
    required this.itemModel,
    this.imageSize = .22,
    this.onTap,
  });

  final ItemModel itemModel;
  final double imageSize;
  final void Function()? onTap;

  @override
  State<HomeItemCard> createState() => _HomeItemCardState();
}

class _HomeItemCardState extends State<HomeItemCard> {
  IconData favoriteIcon = Icons.favorite_outline;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * .55,
              width: MediaQuery.of(context).size.width * .4,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, -0),
                    blurStyle: BlurStyle.solid,
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primaryForegroundColor,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppServerLinks.imageItemsPath}/${widget.itemModel.itemsImage}",
                        height: MediaQuery.of(context).size.width *
                            widget.imageSize,
                        width: MediaQuery.of(context).size.width *
                            widget.imageSize,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      getNameTrans(
                        widget.itemModel.itemsNameAr!,
                        widget.itemModel.itemsName!,
                      ),
                      maxLines: 1,
                      style: AppTextStyle.textStyle16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      getNameTrans(
                        widget.itemModel.categoryModel!.categoriesNameAr!,
                        widget.itemModel.categoryModel!.categoriesName!,
                      ),
                      maxLines: 1,
                      style: AppTextStyle.textStyle16.copyWith(
                        color: AppColors.customGrey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      r"$ " + widget.itemModel.itemsPrice!,
                      style: AppTextStyle.textStyle16,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
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
        ),
      ),
    );
  }
}