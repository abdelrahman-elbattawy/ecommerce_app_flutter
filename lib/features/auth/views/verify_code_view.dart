import 'package:ecommerce_app/core/localization/locale_controller.dart';
import 'package:ecommerce_app/features/auth/controller/verify_code_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/verify_code_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImpl());
    final LocaleController localCont = Get.find();

    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
          textDirection: localCont.codeLang == "AR"
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: const VerifyCodeViewBody()),
    );
  }
}
