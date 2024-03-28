import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeItemCard extends StatelessWidget {
  const HomeItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * .55,
            width: MediaQuery.of(context).size.width * .4,
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
              color: AppColors.primaryForegroundColor,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      "https://localhost/ecommerce/uploads/categories/supermarkets.png",
                      height: MediaQuery.of(context).size.width * .22,
                      width: MediaQuery.of(context).size.width * .22,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Brucoli",
                    style: AppTextStyle.textStyle16,
                  ),
                  Text(
                    "Supermarket",
                    style: AppTextStyle.textStyle16.copyWith(
                      color: AppColors.customGrey,
                    ),
                  ),
                  const Text(
                    r"$18.00",
                    style: AppTextStyle.textStyle16,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
