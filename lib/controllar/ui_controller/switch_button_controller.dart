import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchButtonController extends GetxController {
  RxBool isEnabled = false.obs;
  void swipeSwitch(value) {
    isEnabled.value = value;
    Get.changeThemeMode(isEnabled.value ? ThemeMode.dark : ThemeMode.light);
  }
}
