import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  void intialData();
  void fetchItemsBy();
  void intialServices();
}

class ItemsControllerImpl extends ItemsController {
  late CategoryModel categoryModel;
  late TextEditingController searchController;

  late List<ItemModel> itemsList = [];
  late final HomeRepoImpl _homeRepoImpl;
  bool isAllItems = false;

  @override
  void onInit() {
    intialServices();
    intialData();

    fetchItemsBy();
    super.onInit();
  }

  @override
  void intialServices() {
    _homeRepoImpl = Get.find();
  }

  @override
  void intialData() {
    final categoryCheck = Get.arguments["categoryModel"];

    if (categoryCheck == "-1") {
      isAllItems = true;
    } else {
      categoryModel = categoryCheck;
    }
    searchController = TextEditingController();
  }

  @override
  void fetchItemsBy() async {
    itemsList.clear();

    final results = await _homeRepoImpl.fetchItemsBy(
      isAllItems ? "All" : categoryModel.categoriesId!,
      "All",
    );

    results.fold(
      (failure) {
        if (failure.errMessage == "No data!") {
          CustomSnakBar.showSnack(
            context: Get.context!,
            snackBarType: SnackBarType.warring,
            errMessage: failure.errMessage,
          );
        } else {
          CustomSnakBar.showSnack(
            context: Get.context!,
            snackBarType: SnackBarType.error,
            errMessage: failure.errMessage,
          );
        }
      },
      (data) {
        for (var item in data['data']) {
          itemsList.add(ItemModel.fromJson(item));
        }
      },
    );

    update();
  }
}
