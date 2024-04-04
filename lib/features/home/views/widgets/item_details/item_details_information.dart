import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_info_dec.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_info_rating.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_info_title.dart';
import 'package:flutter/material.dart';

class ItemDetailsInformation extends StatelessWidget {
  const ItemDetailsInformation({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        ItemDetailsInfoTitle(itemModel: itemModel),
        const SizedBox(height: 10),
        ItemDetailsInfoRating(itemModel: itemModel),
        const SizedBox(height: 15),
        ItemDetailsInfoDec(itemModel: itemModel),
      ],
    );
  }
}
