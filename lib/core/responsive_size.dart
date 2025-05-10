import 'package:flutter/material.dart';

class ResponsiveSizes {
  static late double screenWidth;
  static late double screenHeight;

  static late double blockWidth;
  static late double blockHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }

  static double fontSmall = blockWidth * 3;
  static double fontMedium = blockWidth * 4;
  static double fontLarge = blockWidth * 5;

  static double paddingSmall = blockWidth * 2;
  static double paddingMedium = blockWidth * 4;
  static double paddingLarge = blockWidth * 6;

  static double avatarRadiusSmall = blockWidth * 5;
  static double avatarRadiusLarge = blockWidth * 10;
}
