import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_text_form_field_2.dart';
import 'package:ecommerce_app/features/profile/controller/profile_security_controller.dart';
import 'package:ecommerce_app/features/profile/views/profile_account_view.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSecurityView extends StatelessWidget {
  const ProfileSecurityView({super.key});

  static int id = 9;

  @override
  Widget build(BuildContext context) {
    final ProfileSecurityControllerImpl controller =
        Get.put(ProfileSecurityControllerImpl());

    return SafeArea(
      child: Form(
        key: controller.formState,
        child: ListView(
          children: [
            ProfileAppBar(
              title: AppTranslationsKeys.tabProfileMyAccountSecurity.tr,
              backViewId: ProfileAccountView.id,
            ),
            const SizedBox(height: 20),
            ...List.generate(
              controller.textFieldList.length,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child:
                    GetBuilder<ProfileSecurityControllerImpl>(builder: (cont) {
                  return CustomTextFormField2(
                    controller: cont.textFieldList[index].controller,
                    prefixIconData: cont.textFieldList[index].iconData,
                    isSecure: cont.textFieldList[index].isPassword,
                    hintText: cont.textFieldList[index].hintText!.tr,
                    validator: cont.textFieldList[index].validator,
                    onTapPrefix: () {},
                    onTapSuffix: () => cont.showPassword(index),
                    suffixIconData: cont.textFieldList[index].isPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            GetBuilder<ProfileSecurityControllerImpl>(
              builder: (cont) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomButton(
                    title:
                        AppTranslationsKeys.tabProfileMyAccountTitleButton.tr,
                    onPressed: () => cont.saveNewPassowrd(),
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
