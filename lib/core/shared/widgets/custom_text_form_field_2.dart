import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField2 extends StatelessWidget {
  const CustomTextFormField2({
    super.key,
    this.hintText,
    this.iconData,
    this.isSecure = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onTapIcon,
    this.readOnly = false,
  });

  final String? hintText;
  final IconData? iconData;
  final bool isSecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function()? onTapIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade500,
        //     blurRadius: 5,
        //     offset: const Offset(0, -0),
        //     blurStyle: BlurStyle.solid,
        //   ),
        // ],
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
          // fillColor: AppColors.primaryBackgroundColor,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: MediaQuery.of(context).size.width * .035,
          ),
          hintText: hintText,
          suffixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.edit, size: 24),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: onTapIcon,
              child: Icon(iconData, size: 24),
            ),
          ),
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
