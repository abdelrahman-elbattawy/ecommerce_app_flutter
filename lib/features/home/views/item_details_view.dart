import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/features/home/controller/bottom_sheet_controller.dart';
import 'package:ecommerce_app/features/home/controller/item_details_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_floating_button.dart';
import 'package:ecommerce_app/features/home/views/widgets/item_details/item_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImpl());
    Get.put(BottomSheetControllerImpl());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0.0, 0.0),
        child: Container(
          color: AppColors.primaryForegroundColor,
        ),
      ),
      floatingActionButton: const ItemDetailsFloatingButton(),
      body: SafeArea(
        child: Directionality(
          textDirection: getTextDirection(),
          child: const ItemDetailsViewBody(),
        ),
      ),
    );
  }
}
