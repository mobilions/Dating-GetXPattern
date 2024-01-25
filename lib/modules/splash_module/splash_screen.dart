import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syndeo_dating/modules/splash_module/splash_controller.dart';
import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../utils/app_images.dart';
import '../../utils/colors.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: GetBuilder<SplashController>(
        builder: (SplashController splashController) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffff4350),
                Color(0xfff5347f),
                Color(0xffbf00ff),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(42),
              right: getProportionateScreenWidth(42),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                Image.asset(AppImages.appLogo),
                SizedBox(
                  height: getProportionateScreenHeight(18),
                ),
                Text(
                  "Syndeo",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppFonts.fontRecoletaSemiBold,
                    fontSize: getProportionalFontSize(32),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: getProportionateScreenHeight(82),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "WELCOME TO ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts.fontMedium,
                          fontSize: getProportionalFontSize(14),
                        ),
                      ),
                      TextSpan(
                        text: "SYNDEO\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts.fontBold,
                          fontSize: getProportionalFontSize(14),
                        ),
                      ),
                      TextSpan(
                        text: "THE APP FOR LIKE MINDED PEOPLE",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts.fontMedium,
                          fontSize: getProportionalFontSize(14),
                        ),
                      )
                    ]),
                  ),
                  // child: Text(
                  //   "Welcome to Neuropal The app for like minded people"
                  //       .toUpperCase(),
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(color: Colors.white),
                  // ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
