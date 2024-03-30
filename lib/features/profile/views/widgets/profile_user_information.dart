import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUserInformation extends StatelessWidget {
  const ProfileUserInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Get.find<HomeControllerImpl>().userModel;

    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          AppTranslationsKeys.homeTabBarProfile.tr,
          style: AppTextStyle.textStyle20,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * .15,
          child: Image.network(
            "${AppServerLinks.imageUserAvatar}/${userModel.image}",
            height: MediaQuery.of(context).size.width * .3,
            width: MediaQuery.of(context).size.width * .3,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          userModel.userName!,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyle16,
        ),
        const SizedBox(height: 5),
        Text(
          userModel.email!,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyle14.copyWith(
            color: AppColors.customGrey,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }
}
