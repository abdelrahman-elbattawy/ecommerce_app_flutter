import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/features/home/controller/item_details_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImpl());

    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: getTextDirection(),
          child: const ItemDetailsViewBody(),
        ),
      ),
    );
  }
}
