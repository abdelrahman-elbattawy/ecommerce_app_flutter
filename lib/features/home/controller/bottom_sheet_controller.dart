import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/cart/controller/mycart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BottomSheetController extends GetxController {
  void addItem();
  void removeItem();
  void setColorIndex(int index);
  void setSizeIndex(int index);
  String getTotalPrice(String unitPrice);
  void addToCart(ItemModel itemModel);
}

class BottomSheetControllerImpl extends BottomSheetController {
  int itemQuantity = 1;
  int colorIndex = 0;
  int sizeIndex = 0;

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.cyan,
    Colors.pink,
  ];

  List<String> sizes = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];

  @override
  void addItem() {
    itemQuantity += 1;

    update();
  }

  @override
  void removeItem() {
    if (itemQuantity > 1) {
      itemQuantity -= 1;
    }

    update();
  }

  @override
  void setColorIndex(int index) {
    colorIndex = index;

    update();
  }

  @override
  void setSizeIndex(int index) {
    sizeIndex = index;

    update();
  }

  @override
  String getTotalPrice(String unitPrice) {
    final int price = int.parse(unitPrice);
    final int totalPrice = itemQuantity == 0 ? price : price * itemQuantity;

    return totalPrice.toString();
  }

  @override
  void addToCart(ItemModel itemModel) {
    Get.find<MyCartControllerImpl>().createNewItem(itemModel, itemQuantity);

    CustomSnakBar.showSnack(
      context: Get.context!,
      snackBarType: SnackBarType.success,
      errMessage: AppTranslationsKeys.snackBarAddCart.tr,
    );

    Get.back();
  }
}
