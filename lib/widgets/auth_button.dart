import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/app_fonts.dart';
import '../config/size_config.dart';
import '../utils/colors.dart';

class AuthButton extends StatelessWidget {
  final String? imageName, lable;
  final VoidCallback? onTap;

  const AuthButton({super.key, this.imageName, this.lable, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          top: getProportionateScreenHeight(13),
          bottom: getProportionateScreenHeight(13),
          left: getProportionateScreenWidth(39),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(35),
            ),
            border: Border.all(color: AppColors.borderColor)),
        child: Row(
          children: [
            SvgPicture.asset(
              imageName.toString(),
            ),
            SizedBox(width: getProportionateScreenWidth(35),),
            Text(
              lable.toString(),
              style: TextStyle(
                color: Color(0xFF393939),
                fontFamily: AppFonts.fontSemiBold,
                fontSize: getProportionalFontSize(14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
