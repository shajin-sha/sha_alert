import 'package:flutter/material.dart';

class UiColors {
  // Hex to Color
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  // Color to Hex
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8)}';
  }

  // Color to Hex with Alpha
  static String colorToHexWithAlpha(Color color) {
    return '#${color.value.toRadixString(16)}';
  }
}
