import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());

    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
