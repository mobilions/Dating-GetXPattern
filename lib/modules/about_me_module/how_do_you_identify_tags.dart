import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../routes/app_pages.dart';
import '../../utils/colors.dart';
import '../../widgets/common_appbar.dart';
import '../../widgets/common_button.dart';
import 'about_me_controller.dart';

class HowDoYouIdentifyTagsScreen extends GetView<AboutMeController> {
  const HowDoYouIdentifyTagsScreen({super.key});

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
                    horizontal: getProportionateScreenWidth(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      ),
                      Center(
                        child: Text(
                          "Please specify".toUpperCase(),
                          style: TextStyle(
                            fontSize: getProportionalFontSize(14),
                            fontFamily: AppFonts.fontSemiBold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Center(
                        child: Text(
                          "(if you feel comfortable doing so)".toUpperCase(),
                          style: TextStyle(
                            fontSize: getProportionalFontSize(12),
                            fontFamily: AppFonts.fontSemiBold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      TextFormField(
                        // controller: hashTagController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColors.borderColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColors.borderColor,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(15),
                            horizontal: getProportionateScreenWidth(15),
                          ),
                          hintText: "Type your own",
                          hintStyle: TextStyle(
                              fontSize: getProportionalFontSize(14),
                              fontFamily: AppFonts.fontMedium),
                          suffixIcon: Container(
                            margin: EdgeInsets.only(
                              right: getProportionateScreenWidth(10),
                            ),
                            width: getProportionateScreenWidth(60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: getProportionateScreenHeight(35),
                                  child: const VerticalDivider(
                                    color: AppColors.borderColor,
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(
                                    fontFamily: AppFonts.fontBold,
                                    fontSize: getProportionalFontSize(9),
                                    color: AppColors.redColor,
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                text: "NEXT",
                onPresses: () {
                  Get.toNamed(Routes.NEUROLOGICALSTATUS);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
