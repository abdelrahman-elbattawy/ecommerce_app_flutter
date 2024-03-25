class CategoryModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesCreated;

  CategoryModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesCreated,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'].toString();
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesCreated = json['categories_created'];
  }
}
