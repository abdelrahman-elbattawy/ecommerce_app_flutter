import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_list_tile.dart';
import 'package:ecommerce_app/features/profile/controller/profile_help_center_controller.dart';
import 'package:ecommerce_app/features/profile/views/profile_view.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHelpCenterView extends StatelessWidget {
  const ProfileHelpCenterView({super.key});

  static int id = 6;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileHelpCenterControllerImpl());

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAppBar(
            title: AppTranslationsKeys.tabProfileHelpCenter.tr,
            profileId: ProfileView.id,
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              "Faq",
              style: AppTextStyle.textStyle20,
            ),
          ),
          ...List.generate(
            controller.listTiles.length,
            (index) => CustomListTile(
              titleText: controller.listTiles[index].title.tr,
              leadingIconData: Icons.help,
            ),
          ),
        ],
      ),
    );
  }
}
