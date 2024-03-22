import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.iconData,
    this.isSecure = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onTapIcon,
  });

  final String? hintText;
  final String? labelText;
  final IconData? iconData;
  final bool isSecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    LocaleController localCont = Get.find();
    return Directionality(
      textDirection:
          localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        autocorrect: false,
        enableSuggestions: false,
        obscureText: isSecure,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          hintText: hintText,
          labelText: " $labelText ",
          labelStyle: AppTextStyle.textStyle20.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
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
