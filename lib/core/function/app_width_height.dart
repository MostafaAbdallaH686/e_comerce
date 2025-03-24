import 'package:get/get.dart';

abstract class AppWidthHeight {
  static final double width = Get.width;
  static final double height = Get.height;

  static double persantageOfWidth(double persentage) {
    if (persentage > 100 || persentage <= 0) {
      return width;
    }
    return ((width * persentage) / 100);
  }

  static double persantageOfHeight(double persentage) {
    if (persentage > 100 || persentage <= 0) {
      return height;
    }
    return ((height * persentage) / 100);
  }
}
