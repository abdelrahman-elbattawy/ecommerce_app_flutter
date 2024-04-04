import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard({
    super.key,
    required this.categoryModel,
    this.onTap,
  });

  final CategoryModel categoryModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    LocaleController localCont = Get.find();

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * .16,
                width: MediaQuery.of(context).size.width * .23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryForegroundColor,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: onTap,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppServerLinks.imageCategoriesPath}/${categoryModel.categoriesImage}",
                      height: MediaQuery.of(context).size.width * .12,
                      width: MediaQuery.of(context).size.width * .12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            localCont.codeLang == "AR"
                ? categoryModel.categoriesNameAr!
                : categoryModel.categoriesName!,
            style: AppTextStyle.textStyle16,
          ),
        ],
      ),
    );
  }
}
