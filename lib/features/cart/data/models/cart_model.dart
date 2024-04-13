import 'package:ecommerce_app/core/shared/data/models/item_model.dart';

class CartModel {
  ItemModel? itemModel;
  String? quantity;

  CartModel({
    this.itemModel,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    itemModel = ItemModel.fromJson(json);
    quantity = json['quantity'].toString();
  }
}
