import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/home/controller/items_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/items_gride/items_categories_title_list.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsGrideViewBody extends GetView<ItemsControllerImpl> {
  const ItemsGrideViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBar(
          title: AppTranslationsKeys.itemsViewTitle.tr,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomTextField(
            controller: controller.searchController,
            hintText: AppTranslationsKeys.homeViewSeachHint.tr,
            prefixIcon: Icons.search_outlined,
            suffixIcon: Icons.cancel,
            onPrefixIcon: () {},
            onSuffixIcon: () => controller.searchController.clear(),
          ),
        ),
        const SizedBox(height: 25),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: ItemsCategoriesTitleList(),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GetBuilder<ItemsControllerImpl>(
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
                  onTap: () => controller.goToItemDetails(
                    controller.itemsList[index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
