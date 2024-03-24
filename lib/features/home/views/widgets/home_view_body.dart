import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewBody extends GetView<HomeControllerImpl> {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(controller.userModel.email!));
  }
}
