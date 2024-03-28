import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_category_card.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeCategoriesList extends GetView<HomeControllerImpl> {
  const HomeCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .25,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoriesList.length,
        itemBuilder: (context, index) => HomeCategoryCard(
          categoryModel: controller.categoriesList[index],
        ),
      ),
    );
  }
}
