import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/app_images.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class AboutMeController extends GetxController {
  // add_more_photos

  List<String> menuImages = [];

  addMenuContainer() {
    return InkWell(
      onTap: () async {
        ImagePicker imagePicker = ImagePicker();
        List<XFile> files = await imagePicker.pickMultiImage();

        if (files.isNotEmpty) {
          if (files.length + menuImages.length <= 8) {
            files.forEach((element) async {
              File file = await Utils.compressImage(File(element.path));
              menuImages.add(file.path);
              update();
            });
          } else {
            Utils.showToast("Max limit 8 photos");
          }
        }
      },
      child: Container(
        height: 95,
        width: 95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.redColor),
        ),
        child: Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.redColor,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

// how_do_you_identify

  List<IdentifyData> identifyList = [
    IdentifyData("FEMALE", false),
    IdentifyData("MALE", false),
    IdentifyData("NON-BINARY", false),
    IdentifyData("OTHER", false),
  ];

// neuro_logical_status

  List<Personalities> personalityList = [
    Personalities("Foodie", AppImages.foodie, false),
    Personalities("Artsy", AppImages.artsy, false),
    Personalities("DIY", AppImages.diy, false),
    Personalities("Athletic", AppImages.athletic, false),
    Personalities("Shopaholic", AppImages.shopaholic, false),
    Personalities("Yogi", AppImages.yogi, false),
    Personalities("Homebody", AppImages.homebody, false),
    Personalities("Gamer", AppImages.gamer, false),
    Personalities("Adventurous ", AppImages.adventurous, false),
    Personalities("Jetsetter", AppImages.jetSetter, false),
    Personalities("LGBTQI", AppImages.lgbtqi, false),
    Personalities("Student", AppImages.student, false),
    Personalities("Party animal", AppImages.partyAnimal, false),
    Personalities("Coffee addict", AppImages.coffeeAddict, false),
    Personalities("Vegan", AppImages.veggie, false),
    Personalities("Married", AppImages.married, false),
    Personalities("Engaged", AppImages.engaged, false),
    Personalities("Film fan", AppImages.filmFan, false),
    Personalities("Sci fi enthusiast", AppImages.sciFiEnthusiast, false),
    Personalities("Witchy vibes", AppImages.witchyVibes, false),
    Personalities("Perfectionist", AppImages.perfectionist, false),
    Personalities("Messy", AppImages.messy, false),
    Personalities("Neat and tidy", AppImages.neatAndTidy, false),
    Personalities("Hopeless romantic", AppImages.hopelessRomantic, false),
    Personalities("Performing arts", AppImages.performingArts, false),
    Personalities("Music lover", AppImages.musicLover, false),
    Personalities("Animal lover", AppImages.animalLover, false),
    Personalities("Entrepreneurial", AppImages.entrepreneurial, false),
    Personalities("Volunteer", AppImages.volunteer, false),
    Personalities("Bookworm", AppImages.bookworm, false),
    Personalities("Single parent", AppImages.singleParent2, false),
    Personalities("Divorcee", AppImages.divorcee, false),
    Personalities("Extravert", AppImages.extravert, false),
    Personalities("Introvert", AppImages.introvert, false),
  ];
}

class IdentifyData {
  final String? name;
  bool isSelected = false;

  IdentifyData(
    this.name,
    this.isSelected,
  );
}

class Personalities {
  final String? name, imageName;
  bool? isSelected = false;

  Personalities(
    this.name,
    this.imageName,
    this.isSelected,
  );
}
