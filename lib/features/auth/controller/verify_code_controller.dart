import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String verificationCode);
  resendCodeAgain(String verificationCode);
  goToCustomView();
  goToSuccessRegister();
  goToResetPassword();
}

enum ViewType {
  resetPassword,
  successSignUp,
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  late ViewType viweType;
  late String email;
  late String? verifyCode;

  bool isLoading = false;

  late final AuthRepoImpl _authRepoImpl;

  @override
  void onInit() {
    viweType = Get.arguments["viewType"];
    email = Get.arguments["email"];
    _authRepoImpl = Get.find();
    super.onInit();
  }

  @override
  checkCode(String verificationCode) {}

  @override
  goToCustomView() {
    if (viweType == ViewType.resetPassword) {
      goToResetPassword();
    } else if (viweType == ViewType.successSignUp) {
      goToSuccessRegister();
    }
  }

  @override
  resendCodeAgain(String verificationCode) {}

  @override
  goToSuccessRegister() async {
    isLoading = true;

    var results = await _authRepoImpl.checkVerifyCodeWith(
      email,
      verifyCode!,
    );

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        isLoading = false;

        results.fold(
          (failure) {
            CustomSnakBar.showSnack(
              context: Get.context!,
              snackBarType: SnackBarType.error,
              errMessage: failure.errMessage,
            );
          },
          (data) {
            Get.offAllNamed(
              AppRoutes.successView,
              arguments: {
                "textLabelSuccessView": AppTranslationsKeys.successViewText2.tr,
              },
            );

            CustomSnakBar.showSnack(
              context: Get.context!,
              snackBarType: SnackBarType.success,
              errMessage: AppTranslationsKeys.snackBarVerifyCodeSuccess.tr,
            );
          },
        );

        update();
      },
    );

    update();
  }

  @override
  goToResetPassword() async {
    isLoading = true;

    var results = await _authRepoImpl.checkVerifyCodePasswordWith(
      email,
      verifyCode!,
    );

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        isLoading = false;

        results.fold(
          (failure) {
            CustomSnakBar.showSnack(
              context: Get.context!,
              snackBarType: SnackBarType.error,
              errMessage: failure.errMessage,
            );
          },
          (data) {
            Get.offAllNamed(
              AppRoutes.resetPassword,
              arguments: {
                "email": email,
              },
            );

            CustomSnakBar.showSnack(
              context: Get.context!,
              snackBarType: SnackBarType.success,
              errMessage: AppTranslationsKeys.snackBarVerifyCodeSuccess.tr,
            );
          },
        );

        update();
      },
    );

    update();
  }
}
