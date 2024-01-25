import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/loader.dart';
import '../../utils/utils.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscure = true;

  File? imageFile;


}
