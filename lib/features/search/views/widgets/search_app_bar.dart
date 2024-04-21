import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/search/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAppBar extends GetView<SearchControllerImpl> {
  const SearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Expanded(
          child: CustomTextField(
            controller: controller.searchController,
            hintText: AppTranslationsKeys.homeViewSeachHint.tr,
            prefixIcon: Icons.search_outlined,
            suffixIcon: Icons.cancel,
            onPrefixIcon: () {},
            onSuffixIcon: () => controller.searchController.clear(),
            autoFocus: true,
            onChanged: (value) => controller.fetchItemsBy(value),
          ),
        ),
      ],
    );
  }
}
