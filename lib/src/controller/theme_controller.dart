
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDark = false.obs;

  ThemeMode get theme => isDark.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    // Detect system brightness on init
    final Brightness brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    isDark.value = brightness == Brightness.dark;
  }

  void toggleTheme(bool value) {
    isDark.value = value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}
