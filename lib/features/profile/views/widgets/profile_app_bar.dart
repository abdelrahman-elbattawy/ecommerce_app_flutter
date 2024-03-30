import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/features/home/controller/home_tab_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
    required this.title,
    required this.profileId,
  });

  final String title;
  final int profileId;

  @override
  Widget build(BuildContext context) {
    final HomeTabBarControllerImpl homeTabBarController =
        Get.find<HomeTabBarControllerImpl>();
    return Row(
      children: [
        Expanded(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => homeTabBarController.setCurrentIndex(profileId),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: AppTextStyle.textStyle20,
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
