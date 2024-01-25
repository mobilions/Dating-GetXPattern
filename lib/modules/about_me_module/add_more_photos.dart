import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../routes/app_pages.dart';
import '../../widgets/common_appbar.dart';
import '../../widgets/common_button.dart';
import 'about_me_controller.dart';

class AddMorePhotosScreen extends GetView<AboutMeController> {
  const AddMorePhotosScreen({super.key});

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
                          "add more photos".toUpperCase(),
                          style: TextStyle(
                            fontSize: getProportionalFontSize(14),
                            fontFamily: AppFonts.fontSemiBold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(42),
                      ),
                      GridView(
                        shrinkWrap: true,
                        clipBehavior: Clip.none,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 95 / 95,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                        children: [
                          for (int i = 0; i < controller.menuImages.length; i++)
                            File(controller.menuImages[i]).existsSync()
                                ? Container(
                                    height: 95,
                                    width: 95,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(controller.menuImages[i]),
                                          ),
                                        )),
                                    alignment: Alignment.topRight,
                                  )
                                : Container(),
                          controller.menuImages.length < 8
                              ? controller.addMenuContainer()
                              : SizedBox()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                text: "NEXT",
                onPresses: () {
                  Get.toNamed(Routes.HOWDOYOUIDENTIFY);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
