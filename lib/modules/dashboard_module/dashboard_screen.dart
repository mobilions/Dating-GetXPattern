import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../utils/app_images.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../feed_module/feed_screen.dart';
import '../group_module/group_screen.dart';
import '../message_module/message_screen.dart';
import '../profile_module/profile_screen.dart';
import 'dashboard_controller.dart';

class DashBoardScreen extends GetView<DashBoardController> {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      initState: (state) => DashBoardController(),
      global: true,
      autoRemove: false,
      builder: (DashBoardController dashBoardController) {
        return PopScope(
          canPop: controller.canPop,
          onPopInvoked: (didPop) {
            if (controller.currentIndex == 0) {
              controller.canPop = true;
              controller.update();
              Utils.showToast("Press the back button again to exit");
              Future.delayed(
                Duration(seconds: 2),
                () {
                  controller.canPop = false;
                  controller.update();
                },
              );
            } else {
              controller.currentIndex = 0;
              controller.update();
            }
          },
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                onTap: (value) {
                  controller.currentIndex = value;
                  controller.update();
                },
                showUnselectedLabels: true,
                selectedItemColor: AppColors.primaryColor,
                currentIndex: controller.currentIndex,
                unselectedItemColor: Color(0xFF4F4F4F),
                // unselectedIconTheme: IconThemeData(
                //   color: Color(0xFF4F4F4F),
                // ),
                // selectedIconTheme: IconThemeData(
                //   color: AppColors.primaryColor,
                // ),
                selectedLabelStyle: TextStyle(
                    fontSize: getProportionalFontSize(10),
                    color: AppColors.primaryColor,
                    fontFamily: AppFonts.fontBold),
                unselectedLabelStyle: TextStyle(
                    fontSize: getProportionalFontSize(10),
                    color: Color(0xFF4F4F4F),
                    fontFamily: AppFonts.fontMedium),
                // currentIndex: controller.currentIndex,
                items: [
                  BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.all(2),
                      child: Image.asset(
                        AppImages.feed,
                        color: controller.currentIndex == 0
                            ? AppColors.redColor
                            : Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        AppImages.message,
                        color: controller.currentIndex == 1
                            ? AppColors.redColor
                            : Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        AppImages.group,
                        color: controller.currentIndex == 2
                            ? AppColors.redColor
                            : Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        AppImages.profile,
                        color: controller.currentIndex == 3
                            ? AppColors.redColor
                            : Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                ]),
            body: getScreen(),
          ),
        );
      },
    );
  }

  Widget getScreen() {
    Widget widget = FeedScreen();
    if (controller.currentIndex == 0) {
      widget = FeedScreen();
    } else if (controller.currentIndex == 1) {
      widget = MessageScreen();
    } else if (controller.currentIndex == 2) {
      widget = GroupScreen();
    } else if (controller.currentIndex == 3) {
      widget = ProfileScreen();
    }
    return widget;
  }}
