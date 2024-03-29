import 'package:ecommerce_app/features/home/data/models/tab_model.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_view_body.dart';
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
      title: "Home",
      iconData: Icons.home,
    ),
    TabModel(
      widget: const Center(child: Text("Favorite")),
      title: "Favorite",
      iconData: Icons.favorite,
    ),
    TabModel(
      widget: const Center(child: Text("Cart")),
      title: "Cart",
      iconData: Icons.shopping_cart,
    ),
    TabModel(
      widget: const Center(child: Text("Settings")),
      title: "Settings",
      iconData: Icons.settings,
    ),
  ];

  @override
  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
}
