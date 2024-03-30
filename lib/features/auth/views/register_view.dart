// import 'package:ecommerce_app/core/constants/app_colors.dart';
// import 'package:ecommerce_app/core/constants/app_text_style.dart';
// import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/features/auth/controller/register_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterControllerImpl());
    final LocaleController localCont = Get.find();

    return Scaffold(
      appBar: AppBar(
          // title: Text(
          //   AppTranslationsKeys.registerTitle.tr,
          //   style: AppTextStyle.textStyle26.copyWith(
          //     color: AppColors.customGrey.withAlpha(150),
          //   ),
          // ),
          ),
      body: Directionality(
        textDirection:
            localCont.codeLang == "AR" ? TextDirection.rtl : TextDirection.ltr,
        child: const RegisterViewBody(),
      ),
    );
  }
}
