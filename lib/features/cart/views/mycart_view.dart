import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/features/cart/views/widgets/mycart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: getTextDirection(),
          child: const MyCartViewBody(),
        ),
      ),
    );
  }
}
