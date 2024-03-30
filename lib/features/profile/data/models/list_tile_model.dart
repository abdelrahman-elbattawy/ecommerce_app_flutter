import 'package:flutter/material.dart';

class ListTileModel {
  final IconData? iconData;
  final String title;
  final Function()? func;

  ListTileModel({
    this.iconData,
    required this.title,
    this.func,
  });
}
