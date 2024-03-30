import 'package:flutter/material.dart';

class ProfileModel {
  final IconData iconData;
  final String title;
  final Function()? func;

  ProfileModel({
    required this.iconData,
    required this.title,
    this.func,
  });
}
