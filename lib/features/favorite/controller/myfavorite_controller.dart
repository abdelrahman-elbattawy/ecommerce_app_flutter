import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/features/favorite/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController {
  void intialTextEditingController();
  void intialItemsList();
  void setFavorite(ItemModel itemModel);
}

class MyFavoriteControllerImpl extends MyFavoriteController {
  List<ItemModel> itemsList = [];
  late TextEditingController searchController;

  @override
  void onInit() {
    intialTextEditingController();
    intialItemsList();

    super.onInit();
  }

  @override
  void intialItemsList() {
    itemsList = Get.find<FavoriteControllerImpl>().favoritesList;
  }

  @override
  void intialTextEditingController() {
    searchController = TextEditingController();
  }

  @override
  void setFavorite(ItemModel itemModel) {
    Get.find<FavoriteControllerImpl>().setFavorite(itemModel);

    intialItemsList();

    update();
  }
}
