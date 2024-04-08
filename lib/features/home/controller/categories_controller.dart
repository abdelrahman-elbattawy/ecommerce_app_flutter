import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {
  void intialData();
  void goToItems(int selectedIndex);
}

class CategoriesControllerImpl extends CategoriesController {
  List<CategoryModel> categoriesList = [];

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  void intialData() {
    categoriesList.clear();
    categoriesList = Get.arguments["categoriesList"];
  }

  @override
  void goToItems(int selectedIndex) {
    Get.toNamed(
      AppRoutes.items,
      arguments: {
        "categoriesList": categoriesList,
        "selectedIndex": selectedIndex,
      },
    );
  }
}
