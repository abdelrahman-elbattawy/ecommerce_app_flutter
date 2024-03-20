import 'package:ecommerce_app/features/success/views/widgets/success_view_body.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SuccessViewBody(),
    );
  }
}
