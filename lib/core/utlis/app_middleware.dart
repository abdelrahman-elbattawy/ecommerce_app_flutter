import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleWare extends GetMiddleware {
  AppServices appServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    String? appSteps =
        appServices.sharedPreferences.getString(AppPreferencesKeys.onAppSteps);

    if (appSteps == "2") {
      return const RouteSettings(name: AppRoutes.home);
    } else if (appSteps == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
