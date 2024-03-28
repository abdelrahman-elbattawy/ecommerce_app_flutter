import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_category_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoriesTitleList extends StatelessWidget {
  const HomeCategoriesTitleList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: GetBuilder<HomeControllerImpl>(
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
                    : controller.localCont.codeLang == "AR"
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
