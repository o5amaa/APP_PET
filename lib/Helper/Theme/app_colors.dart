import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // * Convert Color from Hex to type Flutter 0xFF999090
  static Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  // * loading
  static final Color lightLoading = _colorFromHex('#D47FA6');
  static final Color darkLoading = _colorFromHex('#35164E');

  // * color  PetApp 0xFF
  static final movBackGround = _colorFromHex('#241332');
  static final movcolorLight = _colorFromHex('#35164E');
  static final movLight = _colorFromHex('##8A56AC');
  static final pinkColor = _colorFromHex('#D47FA6');
  static final btnBackGround = _colorFromHex('#F1F0F2');

  static final Color torchReda = _colorFromHex('#FD1D1D');

  // * colors
  static final Color blackColor = _colorFromHex('#000000');
  static final Color whiteColor = _colorFromHex('#FFFFFF');
  static final Color greyLight = _colorFromHex('#999090');
  static final Color darkGrey = _colorFromHex('#3A3B3C');
  static final Color gry = _colorFromHex('##F1F0F2');

  static final Color blueColor = _colorFromHex('#045EC5');
  static final Color greenColor = _colorFromHex('#0E8A0A');
  static final Color sosColor = _colorFromHex('#52329E');
// ter 0xFF
  static final Color nuonColor = Colors.transparent;

  // * btn Color
  static final List<Color> btnColor = [
    AppColors.whiteColor,
    AppColors.greyLight,
    AppColors.greyLight,
    AppColors.darkGrey,
    AppColors.darkGrey,
    AppColors.blackColor,
  ];

  static final List<Color> btnWithoutColor = [
    AppColors.nuonColor,
    AppColors.nuonColor,
    AppColors.nuonColor,
    AppColors.nuonColor,
    AppColors.nuonColor,
    AppColors.nuonColor,
  ];

  static final List<Color> btnColorBottom = [
    AppColors.btnBackGround,
    AppColors.movBackGround,
  ];

  static final List<Color> waitDataColors = [
    AppColors.pinkColor,
    AppColors.movLight,
    AppColors.movcolorLight,
  ];

  static final List<Color> infoColor = [
    AppColors.blueColor,
    AppColors.sosColor,
  ];
}
