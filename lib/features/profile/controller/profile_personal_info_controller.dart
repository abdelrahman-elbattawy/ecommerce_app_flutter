import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/functions/valid_input_func.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/profile/data/models/text_field_model.dart';
import 'package:ecommerce_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfilePersonalInfoController extends GetxController {
  void intialTextEditingControllers();
  void setTextFieldValues();
  void intialListTextField();
  void intialServices();
  void saveAllData();
  void setFileImage(File image);
  void savePersonalInfo(String? imageName);
}

class ProfilePersonalInfoControllerImpl extends ProfilePersonalInfoController {
  final UserModel userModel = Get.find<HomeControllerImpl>().userModel;

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  late List<TextFieldModel> textFieldList;
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phone;

  late final ProfileRepoImpl _profileRepoImpl;
  late final AppServices _appServices;

  bool isLoading = false;

  File? image;

  @override
  void onInit() {
    intialTextEditingControllers();
    intialListTextField();
    setTextFieldValues();
    intialServices();

    super.onInit();
  }

  @override
  void intialTextEditingControllers() {
    userName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
  }

  @override
  void setTextFieldValues() {
    userName.text = userModel.userName!;
    email.text = userModel.email!;
    phone.text = userModel.phone!;
  }

  @override
  void intialListTextField() {
    textFieldList = [
      TextFieldModel(
        iconData: Icons.person_2,
        controller: userName,
        hintText: "",
        validator: (val) => validInput(val!, 5, 50, InputType.userName),
      ),
      TextFieldModel(
        iconData: Icons.email,
        controller: email,
        hintText: "",
        validator: (val) => validInput(val!, 5, 100, InputType.email),
      ),
      TextFieldModel(
        iconData: Icons.phone,
        controller: phone,
        hintText: "",
        validator: (val) => validInput(val!, 5, 100, InputType.phone),
      ),
    ];
  }

  @override
  void intialServices() {
    _profileRepoImpl = Get.find();
    _appServices = Get.find();
  }

  @override
  void saveAllData() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      isLoading = true;

      String? imageName;

      if (image != null) {
        final results = await _profileRepoImpl.uploadAvatarBy(
          email.text,
          image!,
        );

        results.fold(
          (failure) {
            CustomSnakBar.showSnack(
              context: Get.context!,
              snackBarType: SnackBarType.error,
              errMessage: failure.errMessage,
            );
          },
          (data) {
            imageName = data['data'];
          },
        );
      }

      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          isLoading = false;
          savePersonalInfo(imageName);
          update();
        },
      );

      update();
    }
  }

  @override
  void savePersonalInfo(String? imageName) async {
    final results = await _profileRepoImpl.updateAccountInfo(
      email.text,
      imageName ?? userModel.image!,
      phone.text,
      userName.text,
    );

    results.fold(
      (failure) {
        CustomSnakBar.showSnack(
          context: Get.context!,
          snackBarType: SnackBarType.error,
          errMessage: failure.errMessage,
        );
      },
      (data) {
        _appServices.sharedPreferences.setString(
          AppPreferencesKeys.userModel,
          jsonEncode(data['data']),
        );

        Get.find<HomeControllerImpl>().getUserModel();

        CustomSnakBar.showSnack(
          context: Get.context!,
          snackBarType: SnackBarType.success,
          errMessage: "Your information has been updated!",
        );
      },
    );
  }

  @override
  void setFileImage(File image) {
    this.image = image;

    update();
  }
}
