import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/features/auth/controller/reset_password_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImpl());
    final LocaleController localCont = Get.find();

    return Scaffold(
      body: Directionality(
        textDirection:
            localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
        child: const ResetPasswordViewBody(),
      ),
    );
  }
}
