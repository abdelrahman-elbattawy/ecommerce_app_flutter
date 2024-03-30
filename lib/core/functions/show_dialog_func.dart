import 'package:ecommerce_app/core/constants/app_text_style.dart';
import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future showMyDialog(context, String title, String body) async {
  final LocaleController localCont = Get.find();

  return showDialog(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Directionality(
        textDirection:
            localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
        child: AlertDialog(
          title: Text(
            title,
            style: AppTextStyle.textStyle18,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  body,
                  style: AppTextStyle.textStyle16.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                AppTranslationsKeys.showDialogSignOutConfirm.tr,
                style: AppTextStyle.textStyle16.copyWith(color: Colors.red),
              ),
              onPressed: () => Navigator.pop(context, true),
            ),
            TextButton(
              child: Text(
                AppTranslationsKeys.showDialogSignOutCancel.tr,
                style: AppTextStyle.textStyle16.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    },
  );
}
