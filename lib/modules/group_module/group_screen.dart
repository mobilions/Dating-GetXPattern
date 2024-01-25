import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'group_controller.dart';

class GroupScreen extends GetView<GroupController> {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GroupController>(
        initState: (state) => GroupController(),
        global: true,
        autoRemove: false,
        builder: (GroupController groupController) {
          return Column(
            children: [],
          );
        },
      ),
    );
  }
}
