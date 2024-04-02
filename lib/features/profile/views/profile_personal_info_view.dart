import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/functions/image_picker_func.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_form_field_2.dart';
import 'package:ecommerce_app/features/profile/controller/profile_personal_info_controller.dart';
import 'package:ecommerce_app/features/profile/views/profile_account_view.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_app_bar.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePersonalInfoView extends StatelessWidget {
  const ProfilePersonalInfoView({super.key});

  static int id = 8;

  @override
  Widget build(BuildContext context) {
    final ProfilePersonalInfoControllerImpl controller =
        Get.put(ProfilePersonalInfoControllerImpl());

    return SafeArea(
      child: Form(
        key: controller.formState,
        child: ListView(
          children: [
            ProfileAppBar(
              title: AppTranslationsKeys.tabProfileMyAccountPersonalInfo.tr,
              profileId: ProfileAccountView.id,
            ),
            const SizedBox(height: 10),
            GetBuilder<ProfilePersonalInfoControllerImpl>(
              builder: (cont) {
                return ProfileUserAvatar(
                  imagePath: cont.userModel.image!,
                  isAddPhoto: true,
                  isFileImage: cont.image != null,
                  fileImage: cont.image,
                  onPressed: () async {
                    var image = await imagePicker();
                    cont.setFileImage(image!);
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            ...List.generate(
              controller.textFieldList.length,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: CustomTextFormField2(
                  controller: controller.textFieldList[index].controller,
                  prefixIconData: controller.textFieldList[index].iconData,
                  isSecure: controller.textFieldList[index].isPassword,
                  hintText: controller.textFieldList[index].hintText!.tr,
                  validator: controller.textFieldList[index].validator,
                  readOnly: index == 1,
                  onTapPrefix: () {},
                  onTapSuffix: () {},
                  isSuffixIcon: index != 1,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GetBuilder<ProfilePersonalInfoControllerImpl>(
              builder: (cont) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomButton(
                    title:
                        AppTranslationsKeys.tabProfileMyAccountTitleButton.tr,
                    onPressed: () => cont.saveAllData(),
                    isLoading: cont.isLoading,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
