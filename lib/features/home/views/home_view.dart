import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/controller/home_tab_bar_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    Get.put(HomeTabBarControllerImpl());
    final LocaleController localCont = Get.find();

    return Scaffold(
      bottomNavigationBar: const HomeBottomBar(),
      body: Directionality(
        textDirection:
            localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
        child: GetBuilder<HomeTabBarControllerImpl>(
          builder: (controller) => controller.widgets[controller.currentIndex],
        ),
      ),
    );
  }
}
