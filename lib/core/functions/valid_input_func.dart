import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:get/get.dart';

enum InputType {
  userName,
  email,
  phone,
  password,
}

validInput(String val, int min, int max, InputType type) {
  if (val.isEmpty) {
    return AppTranslationsKeys.emptyValid.tr;
  }

  if (type == InputType.userName && !GetUtils.isUsername(val)) {
    return AppTranslationsKeys.userNameValid.tr;
  } else if (type == InputType.email && !GetUtils.isEmail(val)) {
    return AppTranslationsKeys.emailValid.tr;
  } else if (type == InputType.phone && !GetUtils.isPhoneNumber(val)) {
    return AppTranslationsKeys.phoneNumberValid.tr;
  }

  if (val.length < min) {
    return "${AppTranslationsKeys.minValid.tr} $min";
  }

  if (val.length > max) {
    return "${AppTranslationsKeys.maxValid.tr} $max";
  }
}
