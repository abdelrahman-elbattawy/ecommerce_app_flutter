import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onSuffixIcon,
    this.onPrefixIcon,
    this.onTap,
    this.autoFocus = false,
    this.onChanged,
  });

  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final void Function()? onSuffixIcon;
  final void Function()? onPrefixIcon;
  final void Function()? onTap;
  final bool autoFocus;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      autofocus: autoFocus,
      onTap: onTap,
      controller: controller,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF3F4F6),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: MediaQuery.of(context).size.width * .01,
        ),
        hintText: hintText,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: InkWell(
            onTap: onSuffixIcon,
            child: Icon(
              suffixIcon,
              size: 26,
            ),
          ),
        ),
        // prefixIconColor: AppColors.primaryColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: InkWell(
            onTap: onPrefixIcon,
            child: Icon(
              prefixIcon,
              size: 26,
            ),
          ),
        ),
        enabledBorder: bulidBorder(AppColors.primaryForegroundColor),
        border: bulidBorder(AppColors.primaryForegroundColor),
        focusedBorder: bulidBorder(AppColors.primaryColor),
      ),
    );
  }

  OutlineInputBorder bulidBorder(color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
