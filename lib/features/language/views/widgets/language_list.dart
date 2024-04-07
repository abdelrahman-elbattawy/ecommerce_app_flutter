import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/core/shared/data/static_data.dart';
import 'package:ecommerce_app/features/language/controller/language_controller.dart';
import 'package:ecommerce_app/features/language/views/widgets/language_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LanguageList extends StatelessWidget {
  const LanguageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
