import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeItemsList extends GetView<HomeControllerImpl> {
  const HomeItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .65,
      child: GetBuilder<HomeControllerImpl>(
        builder: (context) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: controller.itemsList.length,
            itemBuilder: (context, index) => HomeItemCard(
              itemModel: controller.itemsList[index],
            ),
          );
        },
      ),
    );
  }
}
