import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/core/shared/datasources/static_data.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/features/language/controller/language_controller.dart';
import 'package:ecommerce_app/features/language/views/widgets/language_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LanguageViewBody extends GetView<LanguageControllerImpl> {
  const LanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppTranslationsKeys.languageTitle.tr,
            style: AppTextStyle.textStyle20,
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: languageList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GetBuilder<LanguageControllerImpl>(builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    controller.setCurrentIndex(index);
                    Get.find<LocaleController>().changeLang(
                      languageList[index].abbreviation!,
                    );
                  },
                  child: LanguageListTile(
                    countryName: languageList[index].countryName!,
                    languageName: languageList[index].languageName!,
                    abbreviation: languageList[index].abbreviation!,
                    image: languageList[index].image!,
                    isSelected: controller.currentIndex == index,
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            title: AppTranslationsKeys.languageButtonText.tr,
            horizontalPadding: 24,
            onPressed: () => Get.toNamed(AppRoutes.onBoarding),
          ),
        ],
      ),
    );
  }
}
