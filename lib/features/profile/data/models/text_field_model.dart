import 'package:flutter/material.dart';

class TextFieldModel {
  final IconData iconData;
  final TextEditingController controller;
  final bool isPassword;
  final String? hintText;
  final String? Function(String?)? validator;

  TextFieldModel({
    required this.iconData,
    required this.controller,
    this.isPassword = false,
    this.hintText,
    this.validator,
  });
}
