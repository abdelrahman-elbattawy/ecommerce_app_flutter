import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeCategoriesList extends GetView<HomeControllerImpl> {
  const HomeCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoriesList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * .15,
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
              Text(
                controller.localCont.codeLang == "AR"
                    ? controller.categoriesList[index].categoriesNameAr!
                    : controller.categoriesList[index].categoriesName!,
                style: AppTextStyle.textStyle16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
