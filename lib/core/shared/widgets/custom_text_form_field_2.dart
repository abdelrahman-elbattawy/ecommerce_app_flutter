import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField2 extends StatelessWidget {
  const CustomTextFormField2({
    super.key,
    this.hintText,
    this.prefixIconData,
    this.isSecure = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onTapPrefix,
    this.onTapSuffix,
    this.readOnly = false,
    this.isSuffixIcon = true,
    this.isPrefixIcon = true,
    this.suffixIconData = Icons.edit,
  });

  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool isSecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function()? onTapPrefix;
  final void Function()? onTapSuffix;
  final bool readOnly;
  final bool isSuffixIcon;
  final bool isPrefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        readOnly: readOnly,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        autocorrect: false,
        enableSuggestions: false,
        obscureText: isSecure,
        decoration: InputDecoration(
          fillColor: const Color(0xffF3F4F6),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: MediaQuery.of(context).size.width * .04,
          ),
          hintText: hintText,
          suffixIcon: isSuffixIcon
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    onPressed: onTapSuffix,
                    icon: Icon(suffixIconData, size: 24),
                  ),
                )
              : null,
          prefixIcon: isPrefixIcon
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    onPressed: onTapPrefix,
                    icon: Icon(prefixIconData, size: 24),
                  ),
                )
              : null,
          enabledBorder: bulidBorder(AppColors.primaryForegroundColor),
          focusedBorder: bulidBorder(AppColors.primaryColor),
          errorBorder: bulidBorder(Colors.red),
          focusedErrorBorder: bulidBorder(Colors.red),
          border: bulidBorder(AppColors.primaryForegroundColor),
        ),
      ),
    );
  }

  OutlineInputBorder bulidBorder(color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
