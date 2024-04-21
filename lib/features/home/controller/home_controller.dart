import 'dart:convert';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/cart/controller/mycart_controller.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/favorite/controller/favorite_controller.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void getUserModel();
  void intiailService();
  void intialControllers();
  void fetchAllData();
  void goToCategories();
  void fetchItemsBy(String categoryID);
  void goToItems(int selectedIndex);
  void setFavorite(ItemModel itemModel);
  onPageChanged(int index);
  void goToSearchView();
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

  late PageController pageController;
  int currentPage = 0;

  @override
  void onInit() {
    intiailService();
    intialControllers();

    getUserModel();

    fetchAllData();
    super.onInit();
  }

  @override
  void getUserModel() {
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
  void intialControllers() {
    searchController = TextEditingController();
    pageController = PageController();
  }

  @override
  void fetchAllData() async {
    isLoading = true;

    final results = await _homeRepoImpl.fetchAllData(userModel.id!);

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

            for (var item in data['data']['items']) {
              itemsList.add(ItemModel.fromJson(item));
            }

            List<ItemModel> favoritesList = [];

            for (var item in data['data']['favoriteItems']) {
              favoritesList.add(ItemModel.fromJson(item));
            }

            Get.find<FavoriteControllerImpl>()
                .intialFavoritesList(favoritesList);

            List<CartModel> cartList = [];

            for (var item in data['data']['cartItems']) {
              cartList.add(CartModel.fromJson(item));
            }

            Get.find<MyCartControllerImpl>().intialList(cartList);
          },
        );

        update();
      },
    );
  }

  @override
  void goToCategories() async {
    await Get.toNamed(
      AppRoutes.categories,
      arguments: {
        "categoriesList": categoriesList,
      },
    );

    update();
  }

  @override
  void goToItems(int selectedIndex) async {
    await Get.toNamed(
      AppRoutes.items,
      arguments: {
        "categoriesList": categoriesList,
        "selectedIndex": selectedIndex,
      },
    );

    update();
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
        for (var category in data['data']) {
          itemsList.add(ItemModel.fromJson(category));
        }
      },
    );

    update();
  }

  @override
  void setFavorite(ItemModel itemModel) {
    Get.find<FavoriteControllerImpl>().setFavorite(itemModel);

    update();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void goToSearchView() {
    Get.toNamed(AppRoutes.searchView);
  }
}
