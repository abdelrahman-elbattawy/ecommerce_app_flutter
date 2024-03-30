import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_list_tile.dart';
import 'package:ecommerce_app/features/profile/controller/profile_controller.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_user_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static int id = 3;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileControllerImpl());

    return SafeArea(
      child: ListView(
        children: [
          const ProfileUserInformation(),
          const SizedBox(height: 20),
          ...List.generate(
            controller.listTiles.length,
            (index) => CustomListTile(
              titleText: controller.listTiles[index].title.tr,
              leadingIconData: controller.listTiles[index].iconData,
              titleColor: index == controller.listTiles.length - 1
                  ? Colors.white
                  : Colors.black,
              iconColor: index == controller.listTiles.length - 1
                  ? Colors.white
                  : Colors.black,
              backgroundColor: index == controller.listTiles.length - 1
                  ? Colors.red
                  : AppColors.primaryBackgroundColor,
              onTap: controller.listTiles[index].func,
            ),
          ),
        ],
      ),
    );
  }
}
