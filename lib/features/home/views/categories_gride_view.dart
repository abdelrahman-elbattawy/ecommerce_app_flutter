import 'package:ecommerce_app/features/home/controller/categories_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/categories_grid_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesGrideView extends StatelessWidget {
  const CategoriesGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesControllerImpl());

    return const Scaffold(
      body: SafeArea(
        child: CategoriesGridViewBody(),
      ),
    );
  }
}
