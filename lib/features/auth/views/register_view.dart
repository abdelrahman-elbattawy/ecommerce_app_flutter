import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/features/auth/controller/register_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterControllerImpl());

    return Scaffold(
      body: Directionality(
        textDirection: getTextDirection(),
        child: const RegisterViewBody(),
      ),
    );
  }
}
