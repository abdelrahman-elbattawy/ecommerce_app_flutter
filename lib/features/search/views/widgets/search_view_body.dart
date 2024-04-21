import 'package:ecommerce_app/core/functions/goto_item_details.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_card.dart';
import 'package:ecommerce_app/features/search/controller/search_controller.dart';
import 'package:ecommerce_app/features/search/views/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ListView(
        children: [
          const SearchAppBar(),
          GetBuilder<SearchControllerImpl>(
            builder: (controller) {
              return GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.4,
                ),
                itemCount: controller.itemsList.length,
                itemBuilder: (context, index) => ItemCard(
                  itemModel: controller.itemsList[index],
                  onTap: () => goToItemDetails(
                    controller.itemsList[index],
                    controller,
                  ),
                  onPressed: () => controller.setFavorite(
                    controller.itemsList[index],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
