import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.iconData,
    this.controller,
    this.onTapIcon,
  });

  final String? hintText;
  final IconData? iconData;
  final TextEditingController? controller;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    LocaleController localCont = Get.find();
    return Directionality(
      textDirection:
          localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: MediaQuery.of(context).size.width * .05,
          ),
          hintText: hintText,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: onTapIcon,
              child: Icon(
                iconData,
                size: 26,
              ),
            ),
          ),
          enabledBorder: bulidBorder(Colors.black),
          focusedBorder: bulidBorder(AppColors.primaryColor),
          errorBorder: bulidBorder(Colors.red),
          focusedErrorBorder: bulidBorder(Colors.red),
          border: bulidBorder(Colors.black),
        ),
      ),
    );
  }

  OutlineInputBorder bulidBorder(color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
