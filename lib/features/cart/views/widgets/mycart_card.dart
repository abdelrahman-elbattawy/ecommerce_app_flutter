import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/functions/get_name_lang_func.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/features/cart/views/widgets/mycart_card_image.dart';
import 'package:ecommerce_app/features/cart/views/widgets/mycart_card_info.dart';
import 'package:flutter/material.dart';

class MyCartCard extends StatelessWidget {
  const MyCartCard({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, -0),
            blurStyle: BlurStyle.solid,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: getNameLang() == "EN"
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCartCardImage(image: itemModel.itemsImage!),
          const SizedBox(width: 10),
          Expanded(
            child: MyCartCardInfo(itemModel: itemModel),
          ),
        ],
      ),
    );
  }
}
