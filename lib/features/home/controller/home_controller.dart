import 'dart:convert';

import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void getUserMode();
  void intiailService();
}

class HomeControllerImpl extends HomeController {
  late final UserModel userModel;
  late final AppServices _appServices;

  @override
  void onInit() {
    intiailService();
    getUserMode();
    super.onInit();
  }

  @override
  void getUserMode() {
    final String? userData =
        _appServices.sharedPreferences.getString('userModel');

    userModel = UserModel.fromJson(jsonDecode(userData!));
  }

  @override
  void intiailService() {
    _appServices = Get.find();
  }
}
