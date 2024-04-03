import 'dart:convert';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void getUserMode();
  void intiailService();
  void intialTextControllers();
  void fetchAllData();
  void setCategoyTitleIndex(int index);
  void goToCategories();
  void fetchItemsBy(String categoryID);
  void goToItems();
}

class HomeControllerImpl extends HomeController {
  late UserModel userModel;
  late final AppServices _appServices;
  late final HomeRepoImpl _homeRepoImpl;
  late final LocaleController localCont;

  List<CategoryModel> categoriesList = [];
  List<ItemModel> itemsList = [];

  late final TextEditingController searchController;

  bool isLoading = false;

  int categoryTitleIndexSelected = 0;

  @override
  void onInit() {
    intiailService();
    intialTextControllers();

    getUserMode();

    fetchAllData();
    super.onInit();
  }

  @override
  void getUserMode() {
    final String? userData =
        _appServices.sharedPreferences.getString(AppPreferencesKeys.userModel);

    userModel = UserModel.fromJson(jsonDecode(userData!));
  }

  @override
  void intiailService() {
    _appServices = Get.find();
    _homeRepoImpl = Get.find();
    localCont = Get.find();
  }

  @override
  void intialTextControllers() {
    searchController = TextEditingController();
  }

  @override
  void fetchAllData() async {
    isLoading = true;

    final results = await _homeRepoImpl.fetchAllData();

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        isLoading = false;

        results.fold(
          (failure) {
            CustomSnakBar.showSnack(
              context: Get.context!,
              snackBarType: SnackBarType.error,
              errMessage: failure.errMessage,
            );
          },
          (data) {
            categoriesList.clear();
            itemsList.clear();

            for (var category in data['data']['categories']) {
              categoriesList.add(CategoryModel.fromJson(category));
            }

            for (var category in data['data']['items']) {
              itemsList.add(ItemModel.fromJson(category));
            }
          },
        );

        update();
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

    update();
  }

  @override
  void goToCategories() {
    Get.toNamed(
      AppRoutes.categories,
      arguments: {
        "categoriesList": categoriesList,
      },
    );
  }

  @override
  void goToItems() {
    final categoryIndex = categoryTitleIndexSelected - 1;

    Get.toNamed(
      AppRoutes.items,
      arguments: {
        "categoryModel": categoryIndex == -1
            ? "-1"
            : categoriesList[categoryTitleIndexSelected - 1],
      },
    );
  }

  @override
  void fetchItemsBy(String categoryID) async {
    itemsList.clear();

    final results = await _homeRepoImpl.fetchItemsBy(categoryID, "5");

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
        for (var category in data['data']) {
          itemsList.add(ItemModel.fromJson(category));
        }
      },
    );

    update();
  }
}
