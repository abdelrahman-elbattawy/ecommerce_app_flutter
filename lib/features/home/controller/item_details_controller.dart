import 'dart:convert';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController {
  void intialData();
  void onSliderChanged(int index);
  void goToItemDetails(ItemModel itemModel);
  void intialServices();
  void fetchItemsBy(String categoryID);
  void getUserModel();
  void setFavorite();
}

class ItemDetailsControllerImpl extends ItemDetailsController {
  late UserModel userModel;
  late ItemModel itemModel;
  late List<String> imagesPath;
  List<ItemModel> similarItemsList = [];

  late final AppServices _appServices;
  late final HomeRepoImpl _homeRepoImpl;

  int currentSlider = 0;
  bool isLoading = true;

  IconData favoriteIcon = Icons.favorite_outline;

  @override
  void onInit() {
    super.onInit();

    intialServices();
    getUserModel();

    intialData();
  }

  @override
  void getUserModel() {
    final String? userData =
        _appServices.sharedPreferences.getString(AppPreferencesKeys.userModel);

    userModel = UserModel.fromJson(jsonDecode(userData!));
  }

  @override
  void intialData() {
    itemModel = Get.arguments["itemModel"];

    imagesPath = [
      "${AppServerLinks.imageItemsPath}/${itemModel.itemsImage}",
      "${AppServerLinks.imageItemsPath}/${itemModel.itemsImage}",
      "${AppServerLinks.imageItemsPath}/${itemModel.itemsImage}",
    ];

    fetchItemsBy(itemModel.categoryModel!.categoriesId!);
  }

  @override
  void intialServices() {
    _appServices = Get.find();
    _homeRepoImpl = Get.find();
  }

  @override
  void onSliderChanged(int index) {
    currentSlider = index;

    update();
  }

  @override
  void fetchItemsBy(String categoryID) async {
    similarItemsList.clear();

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
        for (var category in data['data']) {
          similarItemsList.add(ItemModel.fromJson(category));
        }
      },
    );

    isLoading = false;

    update();
  }

  @override
  void goToItemDetails(ItemModel itemModel) async {
    await Get.delete<ItemDetailsControllerImpl>(force: true);

    await Get.offAndToNamed(
      AppRoutes.itemDetails,
      arguments: {
        "itemModel": itemModel,
      },
    );
  }

  @override
  void setFavorite() {
    favoriteIcon == Icons.favorite_outline
        ? favoriteIcon = Icons.favorite
        : favoriteIcon = Icons.favorite_outline;

    update();
  }
}
