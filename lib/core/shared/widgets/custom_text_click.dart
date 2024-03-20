import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextClick extends StatelessWidget {
  const CustomTextClick({
    super.key,
    required this.text,
    required this.textClick,
    this.onTap,
  });

  final String text;
  final String textClick;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    LocaleController localCont = Get.find();

    return Directionality(
      textDirection:
          localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyle.textStyle16.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.customGrey.withAlpha(150),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              textClick,
              style: AppTextStyle.textStyle16.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
