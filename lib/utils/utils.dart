import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';

// import 'package:permission_handler/permission_handler.dart';

import '../config/app_fonts.dart';
import '../config/size_config.dart';
import 'colors.dart';

class Utils {
  Utils._();

  static bool _loaderActive = false;

  static void showLoader(BuildContext context) {
    if (!_loaderActive) {
      _loaderActive = true;
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black45,
          pageBuilder: (context, animation1, animation2) => Center(
                child: SizedBox(
                    height: SizeConfig.deviceHeight,
                    width: SizeConfig.deviceWidth,
                    child: Platform.isAndroid
                        ? const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primaryColor))
                        : const CupertinoActivityIndicator(
                            color: Colors.white,
                            radius: 25,
                          )),
              ));
    }
  }

  static hideLoader(BuildContext context) {
    if (_loaderActive) {
      _loaderActive = false;
      Navigator.pop(context);
    }
  }

  static Future<File> compressImage(File file) async {
    img.Image? image = await img.decodeImageFile(file.path);

    if (image != null) {
      img.Image? thumbnail;
      if (image.height > image.width) {
        thumbnail = img.copyResize(image,
            height: 1000,
            interpolation: img.Interpolation.nearest,
            maintainAspect: true);
      } else {
        thumbnail = img.copyResize(image,
            width: 1000,
            interpolation: img.Interpolation.nearest,
            maintainAspect: true);
      }

      // Save the thumbnail as a PNG.
      file.writeAsBytesSync(
        img.encodePng(thumbnail),
      );
    }
    return file;
  }

  static Widget toast(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              "${message}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: AppFonts.fontRegular,
                fontSize: getProportionalFontSize(13),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static showToast(String message) {
    // FToast fToast = FToast();
    // fToast.init(navigator!.context);
    // fToast.showToast(
    //   child: toast(message),
    //   gravity: ToastGravity.BOTTOM,
    //   toastDuration: Duration(seconds: 3),
    // );
    Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        msg: message);
  }

  static String formatAccidentListDate(String text) {
    String dateFormat =
        DateFormat.yMMMMEEEEd().format(DateFormat("yyyy-MM-dd").parse(text));
    return dateFormat;
  }



  static showCustomDialog(
      {required context,
      required title,
      bool? bar,
      required description,
      required buttons}) {
    showDialog(
        context: context,
        barrierDismissible: bar ?? false,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: AppFonts.fontSemiBold,
                  fontSize: getProportionalFontSize(16),
                ),
              ),
              content: Text(
                description,
                style: TextStyle(
                  fontFamily: AppFonts.fontRegular,
                  fontSize: getProportionalFontSize(14),
                ),
              ),
              actions: buttons,
            ));
  }

  static customLoader() {
    return Platform.isAndroid
        ? const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor))
        : Center(
            child: const CupertinoActivityIndicator(
              color: Colors.white,
              radius: 25,
            ),
          );
  }

  static Future<String?> datePicker(BuildContext context,
      {DateTime? lastDate, firstDate, initalDate}) async {
    String? dateTime;
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(90),
                horizontal: getProportionateScreenWidth(25)),
            child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                      // onSurface: Colors.white70,
                      primary: AppColors.primaryColor),
                ),
                child: child!),
          );
        },
        context: context,
        initialDate: initalDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime(DateTime.now().year - 1),
        lastDate: lastDate ?? DateTime(2050));

    if (pickedDate != null) {
      final DateFormat serverFormatter = DateFormat('yyyy-MM-dd');
      dateTime = serverFormatter.format(pickedDate);
    }

    return dateTime;
  }

  static void timePicker(
    Function(String time) onSelectTime, {
    TimeOfDay? initialTime,
  }) {
    showTimePicker(
      context: Get.overlayContext!,
      initialTime: initialTime ??
          TimeOfDay.fromDateTime(
            DateTime.now(),
          ),
    ).then((v) {
      if (v != null) {
        final now = DateTime.now();
        final dateTime = DateTime(
          now.year,
          now.month,
          now.day,
          v.hour,
          v.minute,
        );

        onSelectTime(dateTime.formatedDate(dateFormat: 'hh:mm aa'));
      }
    });
  }

  // static Future<CroppedFile?> cropImage(XFile? image,
  //     {bool lockedRatio = true}) async {
  //   return await ImageCropper().cropImage(
  //       sourcePath: image!.path,
  //       aspectRatio: CropAspectRatio(
  //         ratioX: 16,
  //         ratioY: 9,
  //       ),
  //       // aspectRatio:
  //       //     lockedRatio ?  CropAspectRatio(ratioX: 1, ratioY: 1) : null,
  //       aspectRatioPresets: [
  //         CropAspectRatioPreset.ratio16x9,
  //         // CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.ratio5x4,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.square,
  //       ],
  //       uiSettings: [
  //         AndroidUiSettings(
  //           toolbarTitle: 'MYPOLICEREPORT',
  //           toolbarColor: Colors.black,
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.ratio16x9,
  //           lockAspectRatio: true,
  //         ),
  //         IOSUiSettings(
  //           title: 'MYPOLICEREPORT',
  //           doneButtonTitle: 'Done',
  //           aspectRatioLockDimensionSwapEnabled: true,
  //           cancelButtonTitle: 'Cancel',
  //           minimumAspectRatio: 1.0,
  //         ),
  //       ]);
  // }

  static String displayDateFormat(String text) {
    String dateTime = "";
    DateTime date = DateTime.parse(text);
    dateTime = DateFormat("MM/dd/yyyy").format(date);

    return dateTime;
  }

  static String sendDateFormat(String text) {
    String dateTime = "";
    DateTime date = DateFormat("MM/dd/yyyy").parse(text);
    dateTime = DateFormat("yyyy-MM-dd").format(date);

    return dateTime;
  }
}

extension DateTimeFormatterExt on DateTime {
  String formatedDate({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    final formatter = DateFormat(dateFormat);
    return formatter.format(this);
  }
}

extension CompressImage on File {
  Future<File> compressImage() async {
    img.Image? image = await img.decodeImageFile(path);

    // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
    if (image != null) {
      img.Image? thumbnail;
      if (image.height > image.width) {
        thumbnail = img.copyResize(image,
            height: 600,
            interpolation: img.Interpolation.nearest,
            maintainAspect: true);
      } else {
        thumbnail = img.copyResize(image,
            width: 600,
            interpolation: img.Interpolation.nearest,
            maintainAspect: true);
      }

      // Save the thumbnail as a PNG.
      writeAsBytesSync(
        img.encodePng(thumbnail),
      );
    }
    return this;
  }
}
