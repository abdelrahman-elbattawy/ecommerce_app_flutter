import 'package:ecommerce_app/features/success/controller/success_controller.dart';
import 'package:ecommerce_app/features/success/views/widgets/success_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessControllerImpl());

    return Scaffold(
      appBar: AppBar(),
      body: const SuccessViewBody(),
    );
  }
}
