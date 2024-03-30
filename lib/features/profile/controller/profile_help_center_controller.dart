import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/profile/data/models/list_tile_model.dart';
import 'package:get/get.dart';

abstract class ProfileHelpCenterController extends GetxController {
  void intialListTile();
}

class ProfileHelpCenterControllerImpl extends ProfileHelpCenterController {
  late List<ListTileModel> listTiles;

  @override
  void onInit() {
    intialListTile();
    super.onInit();
  }

  @override
  void intialListTile() {
    listTiles = [
      ListTileModel(
        title: AppTranslationsKeys.tabProfileHelpCenterTile1,
      ),
      ListTileModel(
        title: AppTranslationsKeys.tabProfileHelpCenterTile2,
      ),
      ListTileModel(
        title: AppTranslationsKeys.tabProfileHelpCenterTile3,
      ),
      ListTileModel(
        title: AppTranslationsKeys.tabProfileHelpCenterTile4,
      ),
      ListTileModel(
        title: AppTranslationsKeys.tabProfileHelpCenterTile5,
      ),
    ];
  }
}
