import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({
    super.key,
    required this.countryName,
    required this.languageName,
    required this.abbreviation,
    required this.image,
    required this.isSelected,
  });

  final String countryName;
  final String languageName;
  final String abbreviation;
  final String image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * .015,
        horizontal: 12,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected == true
              ? AppColors.primaryColor
              : AppColors.borderSideColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      title: Row(
        children: [
          Text(
            countryName,
            style:
                AppTextStyle.textStyle18.copyWith(fontWeight: FontWeight.w600),
          ),
          // Text(
          //   ' ($abbreviation)',
          //   style: AppTextStyle.textStyle16.copyWith(
          //     fontWeight: FontWeight.normal,
          //   ),
          // ),
        ],
      ),
      trailing: Text(
        ' ($languageName)',
        style: AppTextStyle.textStyle16.copyWith(
          fontWeight: FontWeight.normal,
        ),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}
