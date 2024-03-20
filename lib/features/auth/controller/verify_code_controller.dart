import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/success/controller/success_controller.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String verificationCode);
  resendCodeAgain(String verificationCode);
  goToCustomView();
  setViewType(ViewType type);
}

enum ViewType {
  resetPassword,
  successSignUp,
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  late ViewType viweType;

  @override
  checkCode(String verificationCode) {}

  @override
  setViewType(ViewType type) {
    viweType = type;
  }

  @override
  goToCustomView() {
    if (viweType == ViewType.resetPassword) {
      Get.offAllNamed(AppRoutes.resetPassword);
    } else if (viweType == ViewType.successSignUp) {
      Get.find<SuccessControllerImpl>()
          .setSuccessLabel(AppTranslationsKeys.successViewText2.tr);
      Get.offAllNamed(AppRoutes.successView);
    }
  }

  @override
  resendCodeAgain(String verificationCode) {}
}
