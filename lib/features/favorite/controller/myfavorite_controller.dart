import 'dart:convert';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  void intialServices();
  void fetchAllData();
  void getUserModel();
  void intialTextEditingController();
  void goToItemDetails(ItemModel itemModel);
  void removeFavorite(ItemModel itemModel);
  void addFavorite(ItemModel itemModel);
}

class FavoriteControllerImpl extends FavoriteController {
  late UserModel userModel;
  List<ItemModel> itemsList = [];

  late TextEditingController searchController;
  bool isLoading = false;

  late final FavoriteRepoImpl _favoriteRepoImpl;
  late final AppServices _appServices;

  @override
  void onInit() {
    intialTextEditingController();
    intialServices();

    getUserModel();

    fetchAllData();
    super.onInit();
  }

  @override
  void intialServices() {
    _appServices = Get.find();
    _favoriteRepoImpl = Get.find();
  }

  @override
  void getUserModel() {
    final String? userData =
        _appServices.sharedPreferences.getString(AppPreferencesKeys.userModel);

    userModel = UserModel.fromJson(jsonDecode(userData!));
  }

  @override
  void fetchAllData() async {
    isLoading = true;

    final results = await _favoriteRepoImpl.viewFavorite(userModel.id!);

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        isLoading = false;

        results.fold(
          (failure) {},
          (data) {
            itemsList.clear();

            for (var item in data['data']) {
              itemsList.add(ItemModel.fromJson(item));
            }
          },
        );

        update();
      },
    );
  }

  @override
  void intialTextEditingController() {
    searchController = TextEditingController();
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
  void addFavorite(ItemModel itemModel) async {
    itemModel.favID = "1";
    itemsList.add(itemModel);

    final results = await _favoriteRepoImpl.addFavorite(
      userModel.id!,
      itemModel.itemsId!,
    );

    results.fold(
      (failure) {
        CustomSnakBar.showSnack(
          context: Get.context!,
          snackBarType: SnackBarType.error,
          errMessage: failure.errMessage,
        );
      },
      (data) {
        CustomSnakBar.showSnack(
          context: Get.context!,
          snackBarType: SnackBarType.success,
          errMessage: AppTranslationsKeys.snackBarAddFavorite.tr,
        );
      },
    );

    update();
  }

  @override
  void removeFavorite(ItemModel itemModel) async {
    itemsList.remove(itemModel);

    final results = await _favoriteRepoImpl.removeFavorite(
      userModel.id!,
      itemModel.itemsId!,
    );

    results.fold(
      (failure) {
        CustomSnakBar.showSnack(
          context: Get.context!,
          snackBarType: SnackBarType.error,
          errMessage: failure.errMessage,
        );
      },
      (data) {
        CustomSnakBar.showSnack(
          context: Get.context!,
          snackBarType: SnackBarType.success,
          errMessage: AppTranslationsKeys.snackBarRemoveFavorite.tr,
        );
      },
    );

    update();
  }
}
