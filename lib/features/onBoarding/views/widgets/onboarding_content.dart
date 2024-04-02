import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.body,
  });

  final String image;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: MediaQuery.of(context).size.width * .6,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 32),
        Text(
          title.tr,
          style: AppTextStyle.textStyle20,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          body.tr,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyle18.copyWith(
            color: AppColors.customGrey,
            height: 2,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
