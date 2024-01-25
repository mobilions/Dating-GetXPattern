import 'package:get/get.dart';
import 'package:syndeo_dating/modules/signup_module/signup_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
