import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/goto_item_details.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/favorite/controller/myfavorite_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteViewBody extends GetView<MyFavoriteControllerImpl> {
  const MyFavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 10),
        Text(
          AppTranslationsKeys.homeTabBarFavorite.tr,
          style: AppTextStyle.textStyle20,
          textAlign: TextAlign.center,
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
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GetBuilder<MyFavoriteControllerImpl>(
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
          ),
        ),
      ],
    );
  }
}
