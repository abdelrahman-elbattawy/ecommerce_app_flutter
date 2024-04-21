import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/cart/data/repos/mycart_repo_impl.dart';
import 'package:ecommerce_app/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo_impl.dart';
import 'package:ecommerce_app/features/language/controller/language_controller.dart';
import 'package:ecommerce_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:ecommerce_app/features/search/data/repos/search_repo_impl.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Controllers
    Get.put(LanguageControllerImpl());

    // Api Service
    Get.put(ApiService());

    // Repos Impl
    Get.put(AuthRepoImpl(apiService: Get.find()));
    Get.put(HomeRepoImpl(apiService: Get.find()));
    Get.put(ProfileRepoImpl(apiService: Get.find()));
    Get.put(FavoriteRepoImpl(apiService: Get.find()));
    Get.put(MyCartRepoImpl(apiService: Get.find()));
    Get.put(SearchRepoImpl(apiService: Get.find()));
  }
}
