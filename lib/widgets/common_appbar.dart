import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_fonts.dart';
import '../config/size_config.dart';
import '../utils/colors.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;

  const CommonAppbar({super.key, this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      title: Text(
        title.toString(),
        style: TextStyle(
          fontSize: getProportionalFontSize(14),
          fontFamily: AppFonts.fontBold,
        ),
      ),
      leading: leading ??
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: AppColors.redColor,
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20),),
            onPressed: () {
              Get.back();
            },
            iconSize: 16,
          ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        double.infinity,
        getProportionateScreenHeight(60),
      );
}
