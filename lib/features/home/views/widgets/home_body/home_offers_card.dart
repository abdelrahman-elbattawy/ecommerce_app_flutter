import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeOffersCard extends StatelessWidget {
  const HomeOffersCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LocaleController localCont = Get.find();

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: MediaQuery.of(context).size.width * .4,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                offset: Offset(0, -0),
                blurStyle: BlurStyle.solid,
              )
            ],
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.width * .4,
            width: MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(16),
                bottomRight: const Radius.circular(16),
                topLeft: Radius.elliptical(
                  MediaQuery.of(context).size.width * .1,
                  MediaQuery.of(context).size.width * .5,
                ),
                bottomLeft: Radius.circular(
                  MediaQuery.of(context).size.width * .05,
                ),
              ),
              // color: const Color(0xff74b9ff),
              color: const Color(0xffD2F2F6),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "50%",
                  style: AppTextStyle.textStyle40,
                ),
                Text(
                  "Limited Offer Time",
                  style: AppTextStyle.textStyle18.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: localCont.codeLang == "AR"
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: CachedNetworkImage(
                imageUrl:
                    "https://localhost/ecommerce/uploads/categories/supermarkets.png",
                height: MediaQuery.of(context).size.width * .33,
                width: MediaQuery.of(context).size.width * .33,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
