import 'package:get/get.dart';

import 'group_controller.dart';

class GroupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroupController());
  }
}
