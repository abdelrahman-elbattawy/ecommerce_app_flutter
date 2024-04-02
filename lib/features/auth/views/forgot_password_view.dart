// import 'package:ecommerce_app/core/constants/app_colors.dart';
// import 'package:ecommerce_app/core/constants/app_text_style.dart';
// import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/features/auth/controller/forgot_password_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordControllerImpl());
    final LocaleController localCont = Get.find();

    return Scaffold(
      body: Directionality(
        textDirection:
            localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
        child: const ForgotPasswordViewBody(),
      ),
    );
  }
}
