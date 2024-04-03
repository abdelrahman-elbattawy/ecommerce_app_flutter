import 'package:ecommerce_app/features/home/controller/items_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/items_gride_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsGrideView extends StatelessWidget {
  const ItemsGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImpl());

    return const Scaffold(
      body: SafeArea(
        child: ItemsGrideViewBody(),
      ),
    );
  }
}
