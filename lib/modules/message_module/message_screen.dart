import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'message_controller.dart';

class MessageScreen extends GetView<MessageController> {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MessageController>(
        initState: (state) => MessageController(),
        global: true,
        autoRemove: false,
        builder: (MessageController messageController) {
          return Column(
            children: [],
          );
        },
      ),
    );
  }
}
