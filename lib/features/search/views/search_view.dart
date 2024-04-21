import 'package:ecommerce_app/core/functions/get_text_direction_func.dart';
import 'package:ecommerce_app/features/search/controller/search_controller.dart';
import 'package:ecommerce_app/features/search/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImpl());

    return Scaffold(
      body: Directionality(
        textDirection: getTextDirection(),
        child: const SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
