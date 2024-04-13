import 'package:ecommerce_app/core/constants/app_routes.dart';
import 'package:ecommerce_app/core/shared/data/models/item_model.dart';
import 'package:get/get.dart';

void goToItemDetails(ItemModel itemModel, GetxController controller) async {
  await Get.toNamed(
    AppRoutes.itemDetails,
    arguments: {
      "itemModel": itemModel,
    },
  );

  controller.update();
}

void goToItemDetailsWithRemoveOld(
  ItemModel itemModel,
  GetxController controller,
) async {
  await Get.offNamed(
    AppRoutes.itemDetails,
    arguments: {
      "itemModel": itemModel,
    },
    preventDuplicates: false,
  );

  controller.update();
}
