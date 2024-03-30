import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/home/data/models/tab_model.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_view_body.dart';
import 'package:ecommerce_app/features/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeTabBarController extends GetxController {
  void setCurrentIndex(int index);
}

class HomeTabBarControllerImpl extends HomeTabBarController {
  int currentIndex = 0;

  List<TabModel> tabs = [
    TabModel(
      widget: const HomeViewBody(),
      title: AppTranslationsKeys.homeTabBarHome.tr,
      iconData: Icons.home,
    ),
    TabModel(
      widget: const Center(child: Text("Favorite")),
      title: AppTranslationsKeys.homeTabBarFavorite.tr,
      iconData: Icons.favorite,
    ),
    TabModel(
      widget: const Center(child: Text("Cart")),
      title: AppTranslationsKeys.homeTabBarCart.tr,
      iconData: Icons.shopping_cart,
    ),
    TabModel(
      widget: const ProfileView(),
      title: AppTranslationsKeys.homeTabBarProfile.tr,
      iconData: Icons.person_2,
    ),
  ];

  @override
  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
}
