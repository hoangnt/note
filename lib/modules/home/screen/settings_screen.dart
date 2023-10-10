import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/modules/home/controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  final _controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<SettingsController>(builder: (_) {
          return Column(
            children: [
              Text("LEVEL: ${_controller.level}"),
              Slider(
                max: 5,
                divisions: 5,
                value: _controller.level,
                onChanged: _controller.onChangeLevel,
              ),
            ],
          );
        }),
      ),
    );
  }
}
