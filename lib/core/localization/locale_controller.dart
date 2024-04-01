import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/constants/app_theme_data.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  late String? codeLang;

  AppServices appServices = Get.find();

  ThemeData appTheme = AppThemeData.themeEnglish;

  changeLang(String code) {
    codeLang = code;
    Locale locale = Locale(code);
    appServices.sharedPreferences
        .setString(AppPreferencesKeys.languageCode, code);
    appTheme =
        code == "AR" ? AppThemeData.themeArabic : AppThemeData.themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    codeLang = appServices.sharedPreferences
        .getString(AppPreferencesKeys.languageCode);

    if (codeLang == "AR") {
      language = const Locale("AR");
      appTheme = AppThemeData.themeArabic;
    } else if (codeLang == "EN") {
      language = const Locale("EN");
      appTheme = AppThemeData.themeEnglish;
    } else {
      codeLang = Get.deviceLocale!.languageCode.toUpperCase();
      language = Locale(codeLang!);
      appServices.sharedPreferences
          .setString(AppPreferencesKeys.languageCode, codeLang!);
    }

    super.onInit();
  }
}
