import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(Duration(milliseconds: 3500)).then((value) {
      Get.offAllNamed(Routes.SIGNIN);
    });
    super.onReady();
  }

}
