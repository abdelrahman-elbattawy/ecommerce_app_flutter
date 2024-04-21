import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/features/favorite/controller/favorite_controller.dart';
import 'package:ecommerce_app/features/search/data/repos/search_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  void intialControllers();
  void intiailService();
  void fetchItemsBy(String searchWord);
  void setFavorite(ItemModel itemModel);
}

class SearchControllerImpl extends SearchController {
  List<ItemModel> itemsList = [];

  late final SearchRepoImpl _searchRepoImpl;
  late final TextEditingController searchController;

  @override
  void onInit() {
    intialControllers();
    intiailService();
    super.onInit();
  }

  @override
  void intialControllers() {
    searchController = TextEditingController();
  }

  @override
  void intiailService() {
    _searchRepoImpl = Get.find();
  }

  @override
  void fetchItemsBy(String searchWord) async {
    itemsList.clear();

    final results = await _searchRepoImpl.fetchItemsBy(
      searchWord,
    );

    results.fold(
      (failure) {},
      (data) {
        for (var category in data['data']) {
          itemsList.add(ItemModel.fromJson(category));
        }
      },
    );

    update();
  }

  @override
  void setFavorite(ItemModel itemModel) {
    Get.find<FavoriteControllerImpl>().setFavorite(itemModel);

    update();
  }
}
