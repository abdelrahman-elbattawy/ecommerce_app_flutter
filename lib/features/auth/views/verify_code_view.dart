import 'package:ecommerce_app/features/auth/views/widgets/verify_code_view_body.dart';
import 'package:flutter/material.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const VerifyCodeViewBody(),
    );
  }
}
