import 'package:ecommerce_app/features/language/controller/language_controller.dart';
import 'package:ecommerce_app/features/language/views/widgets/language_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageControllerImpl());

    return const Scaffold(
      body: LanguageViewBody(),
    );
  }
}
