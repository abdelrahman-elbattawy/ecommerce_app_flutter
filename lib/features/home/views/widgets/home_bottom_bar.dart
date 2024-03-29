import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/features/home/controller/home_tab_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeBottomBar extends GetView<HomeTabBarControllerImpl> {
  const HomeBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryForegroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            onTabChange: (value) => controller.setCurrentIndex(value),
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 28,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: AppColors.primaryColor,
            color: Colors.black,
            tabs: [
              ...List.generate(
                controller.tabs.length,
                (index) => GButton(
                  icon: controller.tabs[index].iconData!,
                  text: controller.tabs[index].title!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
