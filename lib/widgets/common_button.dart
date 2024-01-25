// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../config/app_fonts.dart';
import '../config/size_config.dart';

class CommonButton extends StatelessWidget {
  EdgeInsets? margin;
  EdgeInsets? padding;
  double? radius;
  VoidCallback? onPresses;
  String? text;

  CommonButton({
    super.key,
    this.margin,
    this.padding,
    this.radius,
    this.text,
    this.onPresses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: getProportionateScreenHeight(16),
          ),
      width: SizeConfig.deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius ?? getProportionateScreenWidth(35),
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xffff4350),
            Color(0xfff5347f),
            Color(0xffbf00ff),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.383, 1],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(16),
              ),
          shadowColor: Colors.transparent,
        ),
        onPressed: onPresses,
        child: Text(
          text ?? "",
          style: TextStyle(
              color: Colors.white,
              fontSize: getProportionalFontSize(14),
              fontFamily: AppFonts.fontSemiBold,
              letterSpacing: 1.47),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  VoidCallback? onPresses;
  String? text;

  BottomButton({
    super.key,
    this.text,
    this.onPresses,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onPresses,
        child: Container(
          width: SizeConfig.deviceWidth,
          height: getProportionateScreenHeight(80),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffff4350),
                Color(0xfff5347f),
                Color(0xffbf00ff),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(180),
            ),
          ),
          child: Center(
            child: Text(
              text ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionalFontSize(14),
                fontFamily: AppFonts.fontBold,
                letterSpacing: 1.47,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
