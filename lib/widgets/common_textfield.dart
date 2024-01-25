import 'package:flutter/material.dart';

import '../config/app_fonts.dart';
import '../config/size_config.dart';
import '../utils/colors.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({
    this.controller,
    this.obscureText,
    required this.title,
    this.hintText,
  });

  TextEditingController? controller;
  bool? obscureText;
  final String title;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionalFontSize(14),
            fontFamily: AppFonts.fontMedium,
            color: AppColors.greyColor,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText ?? false,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.borderColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.borderColor,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.borderColor),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: getProportionalFontSize(14),
              fontFamily: AppFonts.fontMedium,
              color: Color(0xFFBFC5D9),
            ),
          ),
          style: TextStyle(
            fontSize: getProportionalFontSize(16),
            fontFamily: AppFonts.fontMedium,
            color: Color(0xFF393939),
          ),
        ),
      ],
    );
  }
}
