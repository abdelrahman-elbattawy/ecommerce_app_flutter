import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/features/home/controller/items_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_category_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsCategoriesTitleList extends StatelessWidget {
  const ItemsCategoriesTitleList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: GetBuilder<ItemsControllerImpl>(
        builder: (controller) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: controller.categoriesList.length + 1,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: HomeCategoryTitle(
                title: index == 0
                    ? AppTranslationsKeys.homeViewAllLabel.tr
                    : getNameLang() == "AR"
                        ? controller.categoriesList[index - 1].categoriesNameAr!
                        : controller.categoriesList[index - 1].categoriesName!,
                isSelected: index == controller.categoryTitleIndexSelected,
                onTap: () => controller.setCategoyTitleIndex(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
