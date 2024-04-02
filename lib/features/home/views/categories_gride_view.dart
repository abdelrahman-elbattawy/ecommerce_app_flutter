import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/functions/get_name_trans_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/controller/categories_controller.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesGrideView extends StatelessWidget {
  const CategoriesGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImpl controller = Get.put(CategoriesControllerImpl());

    return Scaffold(
      body: SafeArea(
        child: ListView(
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
        ),
      ),
    );
  }
}

class CategoryCardList extends StatelessWidget {
  const CategoryCardList({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * .42,
              width: MediaQuery.of(context).size.width * .42,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, -0),
                    blurStyle: BlurStyle.solid,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primaryForegroundColor,
              ),
            ),
            Positioned.fill(
              bottom: 15,
              child: Align(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppServerLinks.imageCategoriesPath}/${categoryModel.categoriesImage}",
                  height: MediaQuery.of(context).size.width * .25,
                  width: MediaQuery.of(context).size.width * .25,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  getNameTrans(
                    categoryModel.categoriesNameAr!,
                    categoryModel.categoriesName!,
                  ),
                  style: AppTextStyle.textStyle16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
