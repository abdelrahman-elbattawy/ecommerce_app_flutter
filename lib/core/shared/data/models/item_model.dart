import 'package:ecommerce_app/features/home/data/models/category_model.dart';

class ItemModel {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDec;
  String? itemsDecAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsCreated;
  String? itemsCat;
  CategoryModel? categoryModel;

  ItemModel({
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDec,
    this.itemsDecAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsCreated,
    this.itemsCat,
    this.categoryModel,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'].toString();
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDec = json['items_dec'];
    itemsDecAr = json['items_dec_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'].toString();
    itemsActive = json['items_active'].toString();
    itemsPrice = json['items_price'].toString();
    itemsDiscount = json['items_discount'].toString();
    itemsCreated = json['items_created'];
    itemsCat = json['items_cat'].toString();

    categoryModel = CategoryModel.fromJson(json);
  }
}
