import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syndeo_dating/modules/profile_module/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        initState: (state) => ProfileController(),
        global: true,
        autoRemove: false,
        builder: (ProfileController profileController) {
          return Column(
            children: [],
          );
        },
      ),
    );
  }
}
