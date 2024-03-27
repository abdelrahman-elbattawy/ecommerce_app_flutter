import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewBody extends GetView<HomeControllerImpl> {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextField(
              controller: controller.searchController,
              hintText: AppTranslationsKeys.homeViewSeachHint.tr,
              prefixIcon: Icons.search_outlined,
              suffixIcon: Icons.cancel,
              onPrefixIcon: () {},
              onSuffixIcon: () => controller.searchController.clear(),
            ),
          ),
        ],
      ),
    );
  }
}
