import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Variable to track the current theme (dark or light)
  bool isDark = true;

  // ValueNotifier to control the theme switcher
  final switcherController = ValueNotifier<bool>(false);

  // Method to enable the light theme
  lightTheme() {
    isDark = false; // Set theme to light
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark); // Set system UI to light style
    update(); // Notify listeners to rebuild UI
  }

  // Method to enable the dark theme
  darkTheme() {
    isDark = true; // Set theme to dark
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light); // Set system UI to dark style
    update(); // Notify listeners to rebuild UI
  }

  @override
  void onInit() {
    // Listen to switcherController for changes
    switcherController.addListener(() {
      if (switcherController.value) {
        lightTheme(); // Activate light theme when switch is on
      } else {
        darkTheme(); // Activate dark theme when switch is off
      }
    });
    super.onInit(); // Call the parent class's onInit method
  }
}
