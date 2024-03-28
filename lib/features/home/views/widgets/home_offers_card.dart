import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeOffersCard extends StatelessWidget {
  const HomeOffersCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * .4,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, //New
                    blurRadius: 15.0,
                    offset: Offset(0, -0))
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
                color: const Color(0xff74b9ff),
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
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.network(
                  "https://localhost/ecommerce/uploads/categories/supermarkets.png",
                  height: MediaQuery.of(context).size.width * .33,
                  width: MediaQuery.of(context).size.width * .33,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
