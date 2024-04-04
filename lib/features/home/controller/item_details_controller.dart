import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController {
  void intialData();
  void onSliderChanged(int index);
}

class ItemDetailsControllerImpl extends ItemDetailsController {
  late ItemModel itemModel;
  late List<String> imagesPath;

  int currentSlider = 0;

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  void intialData() {
    itemModel = Get.arguments["itemModel"];

    imagesPath = [
      "${AppServerLinks.imageItemsPath}/${itemModel.itemsImage}",
      "${AppServerLinks.imageItemsPath}/${itemModel.itemsImage}",
      "${AppServerLinks.imageItemsPath}/${itemModel.itemsImage}",
    ];
  }

  @override
  void onSliderChanged(int index) {
    currentSlider = index;

    update();
  }
}
