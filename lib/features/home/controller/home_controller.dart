import 'dart:convert';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void getUserMode();
  void intiailService();
  void intialTextControllers();
}

class HomeControllerImpl extends HomeController {
  late final UserModel userModel;
  late final AppServices _appServices;

  late final TextEditingController searchController;

  @override
  void onInit() {
    intiailService();
    intialTextControllers();

    getUserMode();

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
  }

  @override
  void intialTextControllers() {
    searchController = TextEditingController();
  }
}
