import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/features/favorite/controller/myfavorite_controller.dart';
import 'package:ecommerce_app/features/favorite/views/widgets/myfavorite_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteView extends StatelessWidget {
  const MyFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImpl());

    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: getTextDirection(),
          child: const MyFavoriteViewBody(),
        ),
      ),
    );
  }
}
