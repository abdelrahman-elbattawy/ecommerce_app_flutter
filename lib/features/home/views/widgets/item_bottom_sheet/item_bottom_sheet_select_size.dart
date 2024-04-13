import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/size_item.dart';
import 'package:ecommerce_app/features/home/controller/bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBottomSheetSelectSize extends StatelessWidget {
  const ItemBottomSheetSelectSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTranslationsKeys.bottomSheetSizeLabel.tr,
            style: AppTextStyle.textStyle16.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 10),
          GetBuilder<BottomSheetControllerImpl>(
            builder: (controller) {
              return Row(
                children: List.generate(
                  controller.colors.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: GestureDetector(
                      onTap: () => controller.setSizeIndex(index),
                      child: SizeItem(
                        text: controller.sizes[index],
                        isSelected: index == controller.sizeIndex,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
