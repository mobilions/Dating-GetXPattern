import 'package:get/get.dart';
import 'package:syndeo_dating/modules/profile_module/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
