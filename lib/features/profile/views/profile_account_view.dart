import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_list_tile.dart';
import 'package:ecommerce_app/features/profile/controller/profile_account_controller.dart';
import 'package:ecommerce_app/features/profile/views/profile_view.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAccountView extends StatelessWidget {
  const ProfileAccountView({super.key});

  static int id = 7;

  @override
  Widget build(BuildContext context) {
    final ProfileAccountControllerImpl controller =
        Get.put(ProfileAccountControllerImpl());

    return SafeArea(
      child: ListView(
        children: [
          ProfileAppBar(
            title: AppTranslationsKeys.tabProfileMyAccount.tr,
            profileId: ProfileView.id,
          ),
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
