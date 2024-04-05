import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_image_stack.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_card_info.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.itemModel,
    this.onTap,
    this.imageSize = .3,
  });

  final ItemModel itemModel;
  final void Function()? onTap;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: getNameLang() == "EN"
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            ItemImageStack(
              itemModel: itemModel,
              imageSize: imageSize,
            ),
            const SizedBox(height: 15),
            ItemCardInfo(itemModel: itemModel),
          ],
        ),
      ),
    );
  }
}
