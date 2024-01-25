import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syndeo_dating/modules/signup_module/signup_controller.dart';
import 'package:syndeo_dating/routes/app_pages.dart';

import '../../config/size_config.dart';
import '../../utils/app_images.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_textfield.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<SignUpController>(
        builder: (SignUpController signUpController) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30),
                    ),
                    child: Form(
                        key: controller.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                ImagePicker imagePicker = ImagePicker();
                                XFile? file = await imagePicker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (file != null) {
                                  controller.imageFile = File(file.path);

                                    controller.update();

                                }
                              },
                              child: controller.imageFile != null
                                  ? Container(
                                      margin: EdgeInsets.only(
                                        top: getProportionateScreenHeight(30),
                                        bottom:
                                            getProportionateScreenHeight(50),
                                      ),
                                      height: getProportionateScreenHeight(210),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: FileImage(
                                                controller.imageFile!),
                                            fit: BoxFit.cover),
                                      ),
                                    )
                                  : Container(
                                      height: getProportionateScreenHeight(210),
                                      margin: EdgeInsets.only(
                                        top: getProportionateScreenHeight(30),
                                        bottom:
                                            getProportionateScreenHeight(50),
                                      ),
                                      child: SvgPicture.asset(
                                        AppImages.addPic,
                                        height:
                                            getProportionateScreenHeight(210),
                                      ),
                                    ),
                            ),
                            CommonTextField(
                              title: "Email Address",
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(26),
                            ),
                            CommonTextField(
                              title: "Password",
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(26),
                            ),
                            CommonTextField(
                              title: "Full Name",
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(26),
                            ),
                            CommonTextField(
                              title: "Age",
                            ),
                          ],
                        )),
                  ),
                ),
                CommonButton(
                  text: "SIGN UP",
                  onPresses: () {
                    Get.toNamed(Routes.ADDMOREPHOTOS);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
