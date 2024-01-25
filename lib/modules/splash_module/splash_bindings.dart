import 'package:get/get.dart';
import 'package:syndeo_dating/modules/splash_module/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
