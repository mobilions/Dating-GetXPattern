import 'package:get/get.dart';
import 'package:syndeo_dating/modules/signin_module/signin_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
