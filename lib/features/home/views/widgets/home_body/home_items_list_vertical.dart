import 'package:ecommerce_app/core/functions/goto_item_details.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeItemsListVertical extends GetView<HomeControllerImpl> {
  const HomeItemsListVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImpl>(
      builder: (context) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount:
              controller.itemsList.length > 4 ? 4 : controller.itemsList.length,
          itemBuilder: (context, index) => ItemCardVertical(
            itemModel: controller.itemsList[index],
            onTap: () => goToItemDetails(
              controller.itemsList[index],
              controller,
            ),
          ),
        );
      },
    );
  }
}
