import 'dart:io';

import 'package:ecommerce_app/core/utlis/app_bindings.dart';
import 'package:ecommerce_app/core/localization/app_translations.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/utlis/app_http_overrides.dart';
import 'package:ecommerce_app/core/utlis/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  HttpOverrides.global = AppHttpOverrides();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      locale: controller.language,
      translations: AppTranslations(),
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      initialBinding: AppBindings(),
      getPages: getPages,
    );
  }
}
