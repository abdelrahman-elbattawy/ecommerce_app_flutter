import 'dart:convert';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void getUserMode();
  void intiailService();
  void intialTextControllers();
  void fetchAllData();
  void setCategoyTitleIndex(int index);
}

class HomeControllerImpl extends HomeController {
  late final UserModel userModel;
  late final AppServices _appServices;
  late final HomeRepoImpl _homeRepoImpl;
  late final LocaleController localCont;

  List<CategoryModel> categoriesList = [];

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
            for (var category in data['data']['categories']) {
              categoriesList.add(CategoryModel.fromJson(category));
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
    update();
  }
}
