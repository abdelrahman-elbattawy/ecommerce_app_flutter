import 'package:ecommerce_app/core/shared/widgets/custom_circle_positioned.dart';
import 'package:ecommerce_app/features/auth/controller/register_controller.dart';
import 'package:ecommerce_app/features/auth/views/widgets/register_footer_section.dart';
import 'package:ecommerce_app/features/auth/views/widgets/register_header_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterViewBody extends GetView<RegisterControllerImpl> {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomCirclePositioned(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: controller.formState,
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.width * .4),
                const RegisterHeaderSection(),
                const SizedBox(height: 15),
                const RegisterFooterSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
