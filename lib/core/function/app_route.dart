import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppRoute {
  static void navigateTo(Widget screen) {
    Get.to(screen,
        curve: Curves.easeInOut, duration: Duration(milliseconds: 750));
  }

  static void navigateBack() {
    Get.back();
  }

  // To go to the next screen and no option to go back to the previous screen
  static void navigateToAndNoBack(Widget screen) {
    Get.off(() => screen,
        curve: Curves.easeInOut, duration: Duration(milliseconds: 750));
  }

  // To go to the next screen and cancel all previous routes (useful in shopping carts, polls, and tests)
  static void navigateToAndDeleteAllPathRoute(Widget screen) {
    Get.offAll(screen,
        curve: Curves.easeInOut, duration: Duration(milliseconds: 750));
  }
}
