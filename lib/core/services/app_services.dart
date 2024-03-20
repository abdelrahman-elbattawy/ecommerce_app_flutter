import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
