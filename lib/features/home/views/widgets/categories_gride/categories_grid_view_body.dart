import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/controller/categories_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/categories_gride/categories_card_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesGridViewBody extends GetView<CategoriesControllerImpl> {
  const CategoriesGridViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBar(
          title: AppTranslationsKeys.categoriesViewTitle.tr,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: controller.categoriesList.length,
            itemBuilder: (context, index) => CategoryCardList(
              categoryModel: controller.categoriesList[index],
              onTap: () => controller.goToItems(index + 1),
            ),
          ),
        ),
      ],
    );
  }
}
