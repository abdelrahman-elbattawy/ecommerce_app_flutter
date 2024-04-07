import 'package:ecommerce_app/core/shared/widgets/custom_page_indicator.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/views/widgets/home_body/home_offers_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeOffersList extends GetView<HomeControllerImpl> {
  const HomeOffersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    controller.currentPage = 0;

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * .42,
          child: PageView.builder(
            controller: controller.pageController,
            onPageChanged: (value) => controller.onPageChanged(value),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const HomeOffersCard(),
          ),
        ),
        GetBuilder<HomeControllerImpl>(
          builder: (controler) {
            return CustomPageIndicator(
              listLength: 5,
              currentValue: controler.currentPage,
            );
          },
        ),
      ],
    );
  }
}
