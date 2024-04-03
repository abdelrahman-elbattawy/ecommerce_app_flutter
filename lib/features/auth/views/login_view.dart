import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/features/auth/controller/login_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImpl());

    return Scaffold(
      body: Directionality(
        textDirection: getTextDirection(),
        child: const LoginViewBody(),
      ),
    );
  }
}
