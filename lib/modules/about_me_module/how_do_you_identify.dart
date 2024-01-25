import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../routes/app_pages.dart';
import '../../utils/colors.dart';
import '../../widgets/common_appbar.dart';
import '../../widgets/common_button.dart';
import 'about_me_controller.dart';

class HowDoYouIdentifyScreen extends GetView<AboutMeController> {
  const HowDoYouIdentifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        title: "ABOUT ME",
      ),
      body: GetBuilder<AboutMeController>(
        builder: (AboutMeController aboutMeController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(24),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      ),
                      Center(
                        child: Text(
                          "HOW DO YOU IDENTIFY?",
                          style: TextStyle(
                            fontSize: getProportionalFontSize(14),
                            fontFamily: AppFonts.fontSemiBold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(69),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.identifyList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.identifyList.forEach((element) {
                                element.isSelected = false;
                              });
                              controller.identifyList[index].isSelected = true;
                              controller.update();
                            },
                            child: Container(
                              height: 60,
                              margin: EdgeInsets.only(
                                left: getProportionateScreenWidth(77),
                                right: getProportionateScreenWidth(77),
                                bottom: getProportionateScreenHeight(24),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(35),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffff4350),
                                      Color(0xfff5347f),
                                      Color(0xffbf00ff),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0, 0.383, 1],
                                  )),
                              child: controller.identifyList[index].isSelected == true
                                  ? Center(
                                      child: Text(
                                        controller.identifyList[index].name.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: getProportionalFontSize(14),
                                          fontFamily: AppFonts.fontSemiBold,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 60,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: getProportionateScreenWidth(2),
                                        vertical: getProportionateScreenHeight(2),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            getProportionateScreenWidth(35),
                                          ),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          controller.identifyList[index].name.toString(),
                                          style: TextStyle(
                                            color: AppColors.redColor,
                                            fontSize: getProportionalFontSize(14),
                                            fontFamily: AppFonts.fontSemiBold,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              BottomButton(
                text: "NEXT",
                onPresses: () {
                  Get.toNamed(Routes.HOWDOYOUIDENTIFYTAGS);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
