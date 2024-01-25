import 'package:get/get.dart';

import '../feed_module/feed_controller.dart';
import '../group_module/group_controller.dart';
import '../message_module/message_controller.dart';
import '../profile_module/profile_controller.dart';
import 'dashboard_controller.dart';

class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => FeedController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => GroupController());
    Get.lazyPut(() => ProfileController());
  }
}
