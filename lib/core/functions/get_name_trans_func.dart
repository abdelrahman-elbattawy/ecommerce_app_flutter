import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:get/get.dart';

LocaleController localCont = Get.find();

String getNameTrans(String nameAr, String nameEn) {
  if (localCont.codeLang == "AR") {
    return nameAr;
  } else {
    return nameEn;
  }
}
