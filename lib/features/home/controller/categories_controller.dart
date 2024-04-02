import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {
  void intialData();
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
}
