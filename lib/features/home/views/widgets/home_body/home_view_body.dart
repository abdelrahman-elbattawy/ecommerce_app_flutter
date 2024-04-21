import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/shared/widgets/page_loading_indicator.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_app_bar.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_categories_list.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_items_list.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_items_list_vertical.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_offers_list.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) {
        return controller.isLoading
            ? const PageLoadingIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.width * .18),
                    ),
                    const SliverToBoxAdapter(child: HomeAppBar()),
                    const SliverToBoxAdapter(child: SizedBox(height: 20)),
                    SliverToBoxAdapter(
                      child: CustomTextField(
                        controller: controller.searchController,
                        hintText: AppTranslationsKeys.homeViewSeachHint.tr,
                        prefixIcon: Icons.search_outlined,
                        suffixIcon: Icons.cancel,
                        onPrefixIcon: () {},
                        onSuffixIcon: () => controller.searchController.clear(),
                        onTap: () => controller.goToSearchView(),
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 20)),
                    const SliverToBoxAdapter(child: HomeOffersList()),
                    SliverToBoxAdapter(
                      child: HomeSectionTitle(
                        title: AppTranslationsKeys.homeViewCategoriesLabel.tr,
                        buttonText: AppTranslationsKeys.homeViewSeeAllLabel.tr,
                        onPressed: () => controller.goToCategories(),
                      ),
                    ),
                    const SliverToBoxAdapter(child: HomeCategoriesList()),
                    SliverToBoxAdapter(
                      child: HomeSectionTitle(
                        title: AppTranslationsKeys.homeViewRecommendedLabel.tr,
                        buttonText: AppTranslationsKeys.homeViewSeeAllLabel.tr,
                        onPressed: () => controller.goToItems(0),
                      ),
                    ),
                    const SliverToBoxAdapter(child: HomeItemsList()),
                    SliverToBoxAdapter(
                      child: HomeSectionTitle(
                        title: AppTranslationsKeys.homeViewBestSellerLabel.tr,
                        buttonText: "",
                      ),
                    ),
                    const SliverToBoxAdapter(child: HomeItemsListVertical()),
                    SliverToBoxAdapter(
                      child: HomeSectionTitle(
                        title: AppTranslationsKeys.homeViewMostViewedLabel.tr,
                        buttonText: "",
                      ),
                    ),
                    const SliverToBoxAdapter(child: HomeItemsList()),
                  ],
                ),
              );
      },
    );
  }
}
