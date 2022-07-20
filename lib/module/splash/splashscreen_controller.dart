import 'package:floor_demo/module/home/homescreen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => HomeScreen());
    });
    super.onReady();
  }
}
