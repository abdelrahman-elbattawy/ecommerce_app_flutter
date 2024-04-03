import 'package:ecommerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/controller/categories_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/categories_card_content.dart';
import 'package:flutter/material.dart';

class CategoriesGridViewBody extends StatelessWidget {
  const CategoriesGridViewBody({
    super.key,
    required this.controller,
  });

  final CategoriesControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomAppBar(
          title: "Categories",
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
            ),
          ),
        ),
      ],
    );
  }
}
