import 'dart:convert';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  void intialFavoritesList(List<ItemModel> list);
  void removeFavorite(ItemModel itemModel);
  void addFavorite(ItemModel itemModel);
  void intialServices();
  void getUserModel();
  void setFavorite(ItemModel itemModel);
  bool isFavorite(ItemModel itemModel);
}

class FavoriteControllerImpl extends FavoriteController {
  late UserModel userModel;
  List<ItemModel> favoritesList = [];

  late final FavoriteRepoImpl _favoriteRepoImpl;
  late final AppServices _appServices;

  @override
  void onInit() {
    intialServices();
    getUserModel();

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
  void intialFavoritesList(List<ItemModel> list) {
    favoritesList = list;
  }

  @override
  void setFavorite(ItemModel itemModel) {
    if (isFavorite(itemModel)) {
      removeFavorite(itemModel);
    } else {
      addFavorite(itemModel);
    }
  }

  @override
  void addFavorite(ItemModel itemModel) async {
    favoritesList.add(itemModel);

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
  }

  @override
  void removeFavorite(ItemModel itemModel) async {
    final itemIndex = favoritesList
        .indexWhere((element) => element.itemsId == itemModel.itemsId);
    favoritesList.removeAt(itemIndex);

    // favoritesList.remove(itemModel);

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
  }

  @override
  bool isFavorite(ItemModel itemModel) {
    final itemIndex = favoritesList
        .indexWhere((element) => element.itemsId == itemModel.itemsId);

    if (itemIndex >= 0) {
      return true;
    } else {
      return false;
    }
  }
}
