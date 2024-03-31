import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/valid_input_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/profile/data/models/text_field_model.dart';
import 'package:ecommerce_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileSecurityController extends GetxController {
  void intialTextEditingControllers();
  void intialListTextField();
  void intialServices();
  void saveNewPassowrd();
}

class ProfileSecurityControllerImpl extends ProfileSecurityController {
  final UserModel userModel = Get.find<HomeControllerImpl>().userModel;

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  late List<TextFieldModel> textFieldList;
  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController newRePassword;

  late final ProfileRepoImpl _profileRepoImpl;

  bool isLoading = false;

  @override
  void onInit() {
    intialTextEditingControllers();
    intialListTextField();
    intialServices();

    super.onInit();
  }

  @override
  void intialTextEditingControllers() {
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    newRePassword = TextEditingController();
  }

  @override
  void intialListTextField() {
    textFieldList = [
      TextFieldModel(
        iconData: Icons.lock,
        controller: oldPassword,
        hintText: AppTranslationsKeys.tabProfileMyAccountOldPassword,
        validator: (val) => validInput(val!, 5, 30, InputType.password),
        isPassword: true,
      ),
      TextFieldModel(
        iconData: Icons.lock,
        controller: newPassword,
        hintText: AppTranslationsKeys.tabProfileMyAccountNewPassword,
        validator: (val) => validInput(val!, 5, 30, InputType.password),
        isPassword: true,
      ),
      TextFieldModel(
        iconData: Icons.lock,
        controller: newRePassword,
        hintText: AppTranslationsKeys.tabProfileMyAccountNewPassword,
        validator: (val) {
          if (val != newPassword.text) {
            return AppTranslationsKeys.passwordMatchValid.tr;
          }
          return validInput(val!, 5, 30, InputType.password);
        },
        isPassword: true,
      ),
    ];
  }

  @override
  void intialServices() {
    _profileRepoImpl = Get.find();
  }

  @override
  void saveNewPassowrd() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      isLoading = true;

      final results = await _profileRepoImpl.updatePasswordBy(
        userModel.email!,
        oldPassword.text,
        newPassword.text,
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

              oldPassword.clear();
              newPassword.clear();
              newRePassword.clear();
            },
            (data) {
              CustomSnakBar.showSnack(
                context: Get.context!,
                snackBarType: SnackBarType.success,
                errMessage: "Your password has been updated!",
              );

              oldPassword.clear();
              newPassword.clear();
              newRePassword.clear();
            },
          );

          update();
        },
      );

      update();
    }
  }
}
