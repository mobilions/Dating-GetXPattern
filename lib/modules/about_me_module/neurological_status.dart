import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../routes/app_pages.dart';
import '../../widgets/common_appbar.dart';
import '../../widgets/common_button.dart';
import 'about_me_controller.dart';

class NeuroLogicalStatusScreen extends GetView<AboutMeController> {
  const NeuroLogicalStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        title: "ABOUT ME",
      ),
      body: GetBuilder<AboutMeController>(
        builder: (AboutMeController aboutMeController) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      ),
                      Center(
                        child: Text(
                          "PLEASE SELECT THE FOLLOWING THAT APPLIES TO YOU".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getProportionalFontSize(14),
                            fontFamily: AppFonts.fontSemiBold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(20),
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: getProportionateScreenWidth(30),
                        ),
                        itemCount: controller.personalityList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (controller.personalityList[index].isSelected == true) {
                                controller.personalityList[index].isSelected = false;
                              } else {
                                controller.personalityList[index].isSelected = true;
                              }
                              controller.update();
                            },
                            splashColor: Colors.black12,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.personalityList[index].isSelected == false
                                    ? ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5), BlendMode.dstOut),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            bottom: getProportionateScreenHeight(10),
                                          ),
                                          child: SvgPicture.asset(
                                            controller.personalityList[index].imageName.toString(),
                                            height: 58,
                                            width: 58,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                          bottom: getProportionateScreenHeight(10),
                                        ),
                                        child: SvgPicture.asset(
                                          controller.personalityList[index].imageName.toString(),
                                          height: 58,
                                          width: 58,
                                        ),
                                      ),
                                Flexible(
                                  child: Text(
                                    controller.personalityList[index].name.toString(),
                                    style: TextStyle(
                                      fontSize: getProportionalFontSize(9),
                                      fontFamily: AppFonts.fontBold,
                                      color: controller.personalityList[index].isSelected == true
                                          ? Colors.black
                                          : Color(0xFFA1A1A1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                text: "NEXT",
                onPresses: () {
                  Get.offAllNamed(Routes.DASHBOARD);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
