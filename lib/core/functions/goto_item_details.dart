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

void goToItemDetailsWithRemoveOld<T>(
  ItemModel itemModel,
  GetxController controller,
) async {
  Get.delete<T>();

  await Get.offNamed(
    AppRoutes.itemDetails,
    arguments: {
      "itemModel": itemModel,
    },
    preventDuplicates: false,
  );

  controller.update();
}
