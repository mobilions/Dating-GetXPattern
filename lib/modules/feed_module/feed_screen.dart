import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../utils/app_images.dart';
import 'feed_controller.dart';

class FeedScreen extends GetView<FeedController> {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: getProportionateScreenWidth(26),
            ),
            child: SvgPicture.asset(
              AppImages.filter,
            ),
          ),
        ],
        title: SvgPicture.asset(
          AppImages.syndeo,
          width: getProportionateScreenWidth(160),
          height: getProportionateScreenHeight(28),
        ),
      ),
      body: GetBuilder<FeedController>(
        initState: (state) => FeedController(),
        global: true,
        autoRemove: false,
        builder: (FeedController feedController) {
          return SafeArea(
            child: Column(
              children: [
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "You are currently swiping in",
                          style: TextStyle(
                            fontFamily: AppFonts.fontMedium,
                            fontSize: getProportionalFontSize(11),
                            color: Color(0xFFA1A1A1),
                          ),
                        ),
                        TextSpan(
                          text: " friendship",
                          style: TextStyle(
                            fontFamily: AppFonts.fontBold,
                            fontSize: getProportionalFontSize(11),
                            color: Color(0xFFA1A1A1),
                          ),
                        ),
                        TextSpan(
                          text: " mode",
                          style: TextStyle(
                            fontFamily: AppFonts.fontMedium,
                            fontSize: getProportionalFontSize(11),
                            color: Color(0xFFA1A1A1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(11),),
                SizedBox(
                  height: getProportionateScreenHeight(507),
                  child: CardSwiper(
                    controller: controller.swiperController,
                    cardsCount: controller.datingList.length,
                    numberOfCardsDisplayed: 1,
                    cardBuilder:
                        (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(26),
                          vertical: getProportionateScreenHeight(26),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage(
                                controller.datingList[index].imageName.toString(),
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.datingList[index].name.toString()}, ${controller.datingList[index].age.toString()}",
                              style: TextStyle(
                                fontSize: getProportionalFontSize(24),
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            Text(
                              controller.datingList[index].address.toString(),
                              style: TextStyle(
                                  fontSize: getProportionalFontSize(16),
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            Text(
                              "Lorem ipsum dolor sit aet, consectetur acing elit, sed do eiusmod tempor incididuntdolor sit",
                              style: TextStyle(
                                  fontSize: getProportionalFontSize(12),
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.swiperController.swipeLeft();
                      },
                      child: SvgPicture.asset(
                       AppImages.no,
                        width: getProportionateScreenWidth(75),
                        height: getProportionateScreenHeight(75),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(12),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.swiperController.swipeRight();
                      },
                      child: SvgPicture.asset(
                       AppImages.yes,
                        width: getProportionateScreenWidth(75),
                        height: getProportionateScreenHeight(75),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
