import 'package:ecommerce_app/features/home/controller/item_details_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemSimilarItemsList extends GetView<ItemDetailsControllerImpl> {
  const ItemSimilarItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .65,
      child: GetBuilder<ItemDetailsControllerImpl>(
        builder: (controller) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: controller.similarItemsList.length,
            itemBuilder: (context, index) => ItemCard(
              itemModel: controller.similarItemsList[index],
              onTap: () => controller.goToItemDetails(
                controller.similarItemsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
