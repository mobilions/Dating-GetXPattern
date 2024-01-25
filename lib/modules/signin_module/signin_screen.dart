import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syndeo_dating/modules/signin_module/signin_controller.dart';
import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../routes/app_pages.dart';
import '../../utils/colors.dart';

import '../../config/size_config.dart';
import '../../utils/app_images.dart';
import '../../widgets/auth_button.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInController>(
        builder: (SignInController signInController) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(71),
                    vertical: getProportionateScreenHeight(50),
                  ),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(152),
                    ),
                    gradient: LinearGradient(colors: [
                      Color(0xffff4350),
                      Color(0xfff5347f),
                      Color(0xffbf00ff),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Column(
                    children: [
                      Image.asset(AppImages.appLogo),
                      Text(
                        "Syndeo",
                        style: TextStyle(
                          fontSize: getProportionalFontSize(24),
                          fontFamily: AppFonts.fontRecoletaSemiBold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(14),
                      ),
                      Text(
                        "The app for like minded people".toUpperCase(),
                        style: TextStyle(
                          fontSize: getProportionalFontSize(12),
                          fontFamily: AppFonts.fontSemiBold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(28),
                      ),
                      AuthButton(
                        imageName: AppImages.apple,
                        lable: "Log in with Apple",
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(14),
                      ),
                      AuthButton(
                        imageName: AppImages.facebook,
                        lable: "Log in with Facebook",
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(14),
                      ),
                      AuthButton(
                        imageName: AppImages.google,
                        lable: "Log in with Gmail",
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(14),
                      ),
                      AuthButton(
                        imageName: AppImages.instagram,
                        lable: "Log in with Instagram",
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(14),
                      ),
                      AuthButton(
                        imageName: AppImages.email,
                        lable: "Log in with Email",
                        onTap: () {
                          Get.toNamed(Routes.SIGNINWITHEMAIL);
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(19),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.greyColor,
                              endIndent: getProportionateScreenWidth(12),
                              height: 1,
                              thickness: 1,
                            ),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                                fontSize: getProportionalFontSize(14),
                                fontFamily: AppFonts.fontMedium,
                                color: AppColors.greyColor),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.greyColor,
                              indent: getProportionateScreenWidth(12),
                              height: 1,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(19),
                      ),
                      AuthButton(
                        imageName: AppImages.email,
                        lable: "Sign up with Email",
                        onTap: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(19),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Terms of Use and ",
                              style: TextStyle(
                                color: AppColors.greyColor,
                                fontFamily: AppFonts.fontMedium,
                                fontSize: getProportionalFontSize(14),
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                color: Color(0xFFFF4350),
                                fontFamily: AppFonts.fontBold,
                                decoration: TextDecoration.underline,
                                fontSize: getProportionalFontSize(14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
