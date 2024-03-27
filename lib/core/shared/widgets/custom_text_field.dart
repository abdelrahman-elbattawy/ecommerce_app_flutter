import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onSuffixIcon,
    this.onPrefixIcon,
  });

  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final void Function()? onSuffixIcon;
  final void Function()? onPrefixIcon;

  @override
  Widget build(BuildContext context) {
    LocaleController localCont = Get.find();
    return Directionality(
      textDirection:
          localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
      child: TextField(
        controller: controller,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF3F4F6),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: MediaQuery.of(context).size.width * .035,
          ),
          hintText: hintText,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: onSuffixIcon,
              child: Icon(
                suffixIcon,
                size: 26,
              ),
            ),
          ),
          prefixIconColor: AppColors.primaryColor,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: onPrefixIcon,
              child: Icon(
                prefixIcon,
                size: 26,
              ),
            ),
          ),
          enabledBorder: bulidBorder(Colors.black),
          border: bulidBorder(Colors.black),
        ),
      ),
    );
  }

  OutlineInputBorder bulidBorder(color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xffF3F4F6)));
  }
}
