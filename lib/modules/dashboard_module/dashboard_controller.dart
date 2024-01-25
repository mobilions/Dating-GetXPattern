import 'package:get/get.dart';
import '../../utils/utils.dart';

class DashBoardController extends GetxController {
  int currentIndex = 0;
  bool canPop = false;
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Utils.showToast("Press the back button again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }





}
