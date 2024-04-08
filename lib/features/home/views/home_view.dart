import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/features/favorite/controller/favorite_controller.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/controller/home_tab_bar_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    Get.put(HomeTabBarControllerImpl());
    Get.put(FavoriteControllerImpl());

    return Scaffold(
      bottomNavigationBar: const HomeBottomBar(),
      body: Directionality(
        textDirection: getTextDirection(),
        child: GetBuilder<HomeTabBarControllerImpl>(
          builder: (controller) => controller.widgets[controller.currentIndex],
        ),
      ),
    );
  }
}
