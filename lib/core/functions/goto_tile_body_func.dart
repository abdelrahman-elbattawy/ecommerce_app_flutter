import 'package:ecommerce_app/features/home/controller/home_tab_bar_controller.dart';
import 'package:get/get.dart';

void goToTileBody(int index) {
  final controller = Get.find<HomeTabBarControllerImpl>();
  controller.setCurrentIndex(index);
}
