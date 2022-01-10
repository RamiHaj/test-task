import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/constants/colors.dart';
import 'package:test_task/application/auth/wrapper/wrapper_controller.dart';

class WrapperView extends GetView<WrapperController> {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: CustomColors.amber,
      )),
    );
  }
}
