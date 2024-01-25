import 'package:get/get.dart';

import 'feed_controller.dart';
class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedController());
  }
}
