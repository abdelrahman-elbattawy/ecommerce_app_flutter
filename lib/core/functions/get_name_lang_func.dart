import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:get/get.dart';

LocaleController localCont = Get.find();

String getNameLang() {
  if (localCont.codeLang == "AR") {
    return "AR";
  } else {
    return "EN";
  }
}
