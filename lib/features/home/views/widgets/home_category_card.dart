import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeCategoryCard extends GetView<HomeControllerImpl> {
  const HomeCategoryCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
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
                  color: AppColors.primartForegroundColor,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    "${AppServerLinks.imageCategoriesPath}/${controller.categoriesList[index].categoriesImage}",
                    height: MediaQuery.of(context).size.width * .12,
                    width: MediaQuery.of(context).size.width * .12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            controller.localCont.codeLang == "AR"
                ? controller.categoriesList[index].categoriesNameAr!
                : controller.categoriesList[index].categoriesName!,
            style: AppTextStyle.textStyle16,
          ),
        ],
      ),
    );
  }
}
