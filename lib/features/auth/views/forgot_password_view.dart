import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
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

    return Scaffold(
      body: Directionality(
        textDirection: getTextDirection(),
        child: const ForgotPasswordViewBody(),
      ),
    );
  }
}
