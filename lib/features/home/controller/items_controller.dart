import 'dart:convert';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  void intialData();
  void fetchItemsBy(String categoryID);
  void intialServices();
  void goToItemDetails(ItemModel itemModel);
  void getUserModel();
  void setCategoyTitleIndex(int index);
}

class ItemsControllerImpl extends ItemsController {
  late UserModel userModel;

  late CategoryModel categoryModel;
  late TextEditingController searchController;

  late List<ItemModel> itemsList = [];
  List<CategoryModel> categoriesList = [];

  late final HomeRepoImpl _homeRepoImpl;
  late final AppServices _appServices;

  int categoryTitleIndexSelected = 0;

  @override
  void onInit() {
    intialServices();
    getUserModel();

    intialData();

    super.onInit();
  }

  @override
  void intialServices() {
    _appServices = Get.find();
    _homeRepoImpl = Get.find();
  }

  @override
  void getUserModel() {
    final String? userData =
        _appServices.sharedPreferences.getString(AppPreferencesKeys.userModel);

    userModel = UserModel.fromJson(jsonDecode(userData!));
  }

  @override
  void intialData() {
    itemsList = Get.arguments["itemsList"];
    categoriesList = Get.arguments["categoriesList"];

    searchController = TextEditingController();
  }

  @override
  void fetchItemsBy(String categoryID) async {
    itemsList.clear();

    final results = await _homeRepoImpl.fetchItemsBy(
      userModel.id!,
      categoryID,
    );

    results.fold(
      (failure) {
        if (failure.errMessage == "No data!") {
          CustomSnakBar.showSnack(
            context: Get.context!,
            snackBarType: SnackBarType.warring,
            errMessage: AppTranslationsKeys.snackBarNoData.tr,
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

  @override
  void goToItemDetails(ItemModel itemModel) {
    Get.toNamed(
      AppRoutes.itemDetails,
      arguments: {
        "itemModel": itemModel,
      },
    );
  }

  @override
  void setCategoyTitleIndex(int index) {
    categoryTitleIndexSelected = index;

    if (index != 0) {
      fetchItemsBy(categoriesList[index - 1].categoriesId!);
    } else {
      fetchItemsBy("All");
    }
  }
}
