import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/home/data/models/tab_model.dart';
import 'package:ecommerce_app/features/home/views/categories_gride_view.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_view_body.dart';
import 'package:ecommerce_app/features/profile/controller/profile_account_controller.dart';
import 'package:ecommerce_app/features/profile/controller/profile_help_center_controller.dart';
import 'package:ecommerce_app/features/profile/controller/profile_personal_info_controller.dart';
import 'package:ecommerce_app/features/profile/controller/profile_security_controller.dart';
import 'package:ecommerce_app/features/profile/controller/profile_settings_controller.dart';
import 'package:ecommerce_app/features/profile/views/profile_account_view.dart';
import 'package:ecommerce_app/features/profile/views/profile_help_center_view.dart';
import 'package:ecommerce_app/features/profile/views/profile_personal_info_view.dart';
import 'package:ecommerce_app/features/profile/views/profile_security_view.dart';
import 'package:ecommerce_app/features/profile/views/profile_settings_view.dart';
import 'package:ecommerce_app/features/profile/views/profile_view.dart';
import 'package:ecommerce_app/features/profile/views/profile_language_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeTabBarController extends GetxController {
  void setCurrentIndex(int index);
  void deleteCurrentController();
}

class HomeTabBarControllerImpl extends HomeTabBarController {
  int currentIndex = 0;

  List widgets = [
    const HomeViewBody(),
    const Center(child: Text("Favorite")),
    const Center(child: Text("Cart")),
    const ProfileView(),
    const ProfileSettingsView(),
    const ProfileLanguageView(),
    const ProfileHelpCenterView(),
    const ProfileAccountView(),
    const ProfilePersonalInfoView(),
    const ProfileSecurityView(),
    const CategoriesGrideView(),
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
    deleteCurrentController();

    currentIndex = index;

    update();
  }

  @override
  void deleteCurrentController() {
    if (currentIndex == 4) {
      Get.delete<ProfileSettingsControllerImpl>();
    } else if (currentIndex == 6) {
      Get.delete<ProfileHelpCenterControllerImpl>();
    } else if (currentIndex == 7) {
      Get.delete<ProfileAccountControllerImpl>();
    } else if (currentIndex == 8) {
      Get.delete<ProfilePersonalInfoControllerImpl>();
    } else if (currentIndex == 9) {
      Get.delete<ProfileSecurityControllerImpl>();
    }
  }
}
