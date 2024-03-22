import 'package:flutter/material.dart';

enum SnackBarType {
  warring(
    color: Colors.orange,
    acentColor: Colors.orangeAccent,
    icon: Icon(
      Icons.error,
      color: Colors.white,
    ),
    snackLabel: 'Warring',
    aplhaColor: Color(0xffFFF8EB),
  ),
  error(
    color: Colors.red,
    acentColor: Colors.redAccent,
    icon: Icon(
      Icons.cancel,
      color: Colors.white,
    ),
    snackLabel: 'Something went wrong!',
    aplhaColor: Color(0xffFBF0ED),
  ),
  success(
    color: Colors.green,
    acentColor: Colors.greenAccent,
    icon: Icon(
      Icons.shield,
      color: Colors.white,
    ),
    snackLabel: 'Congratulation!',
    aplhaColor: Color(0xffF2F8F4),
  );

  final Color color;
  final Color acentColor;
  final Icon icon;
  final String snackLabel;
  final Color aplhaColor;

  const SnackBarType({
    required this.color,
    required this.acentColor,
    required this.icon,
    required this.snackLabel,
    required this.aplhaColor,
  });
}

class CustomSnakBar {
  static showSnack({
    required BuildContext context,
    required SnackBarType snackBarType,
    required String errMessage,
  }) {
    SnackBar snackBar = SnackBar(
      content: Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: snackBarType.color.withAlpha(90), width: 2),
          color: snackBarType.aplhaColor,
        ),
        child: Row(
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: snackBarType.acentColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: snackBarType.icon),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      snackBarType.snackLabel,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      errMessage,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.close,
                  color: Colors.black.withOpacity(.8),
                ),
              ),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16),
      duration: const Duration(seconds: 3),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
