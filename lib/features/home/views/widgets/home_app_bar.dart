import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends GetView<HomeControllerImpl> {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * .06,
            child: Image.network(
              "${AppServerLinks.userAvatar}/${controller.userModel.image}",
              height: MediaQuery.of(context).size.width * .13,
              width: MediaQuery.of(context).size.width * .13,
            ),
          ),
          const Spacer(),
          Text(
            controller.userModel.userName!,
            style: AppTextStyle.textStyle18,
          ),
          const Spacer(flex: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active_outlined,
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
