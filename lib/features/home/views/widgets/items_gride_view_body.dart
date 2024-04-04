import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/get_name_trans_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/home/controller/items_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsGrideViewBody extends GetView<ItemsControllerImpl> {
  const ItemsGrideViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBar(
          title: controller.isAllItems
              ? AppTranslationsKeys.itemsViewTitle.tr
              : getNameTrans(
                  controller.categoryModel.categoriesNameAr!,
                  controller.categoryModel.categoriesName!,
                ),
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
        const SizedBox(height: 20),
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
                ),
                itemCount: controller.itemsList.length,
                itemBuilder: (context, index) => HomeItemCard(
                  itemModel: controller.itemsList[index],
                  imageSize: .18,
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
