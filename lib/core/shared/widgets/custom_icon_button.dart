import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.iconData,
    this.iconSize = 24,
  });

  final void Function()? onPressed;
  final IconData iconData;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      icon: Icon(iconData, size: iconSize),
      iconSize: iconSize,
      style: IconButton.styleFrom(
        iconSize: iconSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: Size(iconSize + 10, iconSize + 10),
        side: const BorderSide(width: 1),
      ),
    );
  }
}
