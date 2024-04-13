import 'dart:convert';

import 'package:ecommerce_app/core/constants/app_preferences_keys.dart';
import 'package:ecommerce_app/core/services/app_services.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:ecommerce_app/core/shared/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/data/repos/mycart_repo_impl.dart';
import 'package:get/get.dart';

abstract class MyCartController extends GetxController {
  void intialList(List<CartModel> list);
  void addItem(String itemId);
  void removeItem(String itemId);
  String getQuantity(String itemId);
  CartModel getItem(String itemId);
  void intialServices();
  void getUserModel();
  void removeItemFromDatabase(CartModel item);
  void addItemToDatabase(CartModel item);
  void createNewItem(ItemModel itemModel, int itemQuantity);
  String getSubTotal();
  String getTotal();
}

class MyCartControllerImpl extends MyCartController {
  late UserModel userModel;
  List<CartModel> cartList = [];

  late final AppServices _appServices;
  late final MyCartRepoImpl _myCartRepoImpl;

  @override
  void onInit() {
    intialServices();
    getUserModel();

    super.onInit();
  }

  @override
  void intialServices() {
    _appServices = Get.find();
    _myCartRepoImpl = Get.find();
  }

  @override
  void getUserModel() {
    final String? userData =
        _appServices.sharedPreferences.getString(AppPreferencesKeys.userModel);

    userModel = UserModel.fromJson(jsonDecode(userData!));
  }

  @override
  void intialList(List<CartModel> list) {
    cartList = list;
  }

  @override
  void addItem(String itemId) async {
    final item = getItem(itemId);

    final itemQuantity = int.parse(item.quantity!);
    item.quantity = (itemQuantity + 1).toString();

    addItemToDatabase(item);

    update();
  }

  @override
  void removeItem(String itemId) async {
    final item = getItem(itemId);

    removeItemFromDatabase(item);

    final itemQuantity = int.parse(item.quantity!);
    if (itemQuantity > 1) {
      item.quantity = (itemQuantity - 1).toString();
    } else {
      cartList.remove(item);
    }

    update();
  }

  @override
  String getQuantity(String itemId) {
    final item = getItem(itemId);
    return item.quantity!;
  }

  @override
  CartModel getItem(String itemId) {
    final itemIndex = cartList.indexWhere(
      (element) => element.itemModel!.itemsId == itemId,
    );

    return cartList[itemIndex];
  }

  @override
  void addItemToDatabase(CartModel item) async {
    final results = await _myCartRepoImpl.addItem(
      userModel.id!,
      item.itemModel!.itemsId!,
    );

    results.fold(
      (failure) {
        CustomSnakBar.showSnack(
          context: Get.context!,
          snackBarType: SnackBarType.error,
          errMessage: failure.errMessage,
        );
      },
      (data) {},
    );
  }

  @override
  void removeItemFromDatabase(CartModel item) async {
    final results = await _myCartRepoImpl.removeItem(
      userModel.id!,
      item.itemModel!.itemsId!,
    );

    results.fold(
      (failure) {
        CustomSnakBar.showSnack(
          context: Get.context!,
          snackBarType: SnackBarType.error,
          errMessage: failure.errMessage,
        );
      },
      (data) {},
    );
  }

  @override
  void createNewItem(ItemModel itemModel, int itemQuantity) {
    final itemCart =
        CartModel(itemModel: itemModel, quantity: itemQuantity.toString());

    cartList.add(itemCart);

    for (var i = 0; i < itemQuantity; i++) {
      addItemToDatabase(itemCart);
    }
  }

  @override
  String getSubTotal() {
    double totalPrice = 0.0;

    for (var item in cartList) {
      final double unitPrice = double.parse(item.itemModel!.itemsPrice!);
      final double unitQuantity = double.parse(item.quantity!);

      totalPrice += unitPrice * unitQuantity;
    }

    return totalPrice.toString();
  }

  @override
  String getTotal() {
    double totalPrice = double.parse(getSubTotal());

    return totalPrice.toString();
  }
}
