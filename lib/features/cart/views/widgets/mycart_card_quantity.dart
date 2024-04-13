import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_icon_button.dart';
import 'package:ecommerce_app/features/cart/controller/mycart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyCartCardQuantity extends GetView<MyCartControllerImpl> {
  const MyCartCardQuantity({
    super.key,
    required this.itemId,
  });

  final String itemId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        children: [
          CustomIconButton(
            onPressed: () => controller.removeItem(itemId),
            iconData: Icons.remove,
            iconSize: 16,
          ),
          Text(
            controller.getQuantity(itemId),
            style: AppTextStyle.textStyle18,
          ),
          CustomIconButton(
            onPressed: () => controller.addItem(itemId),
            iconData: Icons.add,
            iconSize: 16,
          ),
        ],
      ),
    );
  }
}
