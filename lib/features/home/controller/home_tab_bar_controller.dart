import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/home/data/models/tab_model.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_view_body.dart';
import 'package:ecommerce_app/features/profile/views/profile_help_center_view.dart';
import 'package:ecommerce_app/features/profile/views/profile_settings_view.dart';
import 'package:ecommerce_app/features/profile/views/profile_view.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_settings_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeTabBarController extends GetxController {
  void setCurrentIndex(int index);
}

class HomeTabBarControllerImpl extends HomeTabBarController {
  int currentIndex = 0;

  List widgets = [
    const HomeViewBody(),
    const Center(child: Text("Favorite")),
    const Center(child: Text("Cart")),
    const ProfileView(),
    const ProfileSettingsView(),
    const ProfileSettingsLanguage(),
    const ProfileHelpCenterView(),
  ];

  List<TabModel> tabs = [
    TabModel(
      title: AppTranslationsKeys.homeTabBarHome,
      iconData: Icons.home,
    ),
    TabModel(
      title: AppTranslationsKeys.homeTabBarFavorite,
      iconData: Icons.favorite,
    ),
    TabModel(
      title: AppTranslationsKeys.homeTabBarCart,
      iconData: Icons.shopping_cart,
    ),
    TabModel(
      title: AppTranslationsKeys.homeTabBarProfile,
      iconData: Icons.person_2,
    ),
  ];

  @override
  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
}
