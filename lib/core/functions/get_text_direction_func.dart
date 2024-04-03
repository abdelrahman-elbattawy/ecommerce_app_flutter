import 'dart:ui';

import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:get/get.dart';

final LocaleController localCont = Get.find();

getTextDirection() {
  return localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr;
}
