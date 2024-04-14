import "package:flutter/material.dart";

abstract class AppPalette {
  static const Color lightPrimary = Color(0xFFFFD2A9);
  static const Color primary = Color(0xFFF49781);
  static const Color darkPrimary = Color(0xFFFF5962);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF3C3C3C);
  static const Color grey = Color(0xFF908F9D);
  static const Color border = Color(0xFFE6E6E6);
  static const Color transparent = Color(0x00000000);

  static const Color green = Color(0xFF4EBEA0);
  static const Color blue = Color(0xFF2689C9);
  static const Color red = Color(0xFFE93636);

  static final LinearGradient lightGradient = LinearGradient(
    colors: [lightPrimary.withOpacity(0.15), darkPrimary.withOpacity(0.15)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    tileMode: TileMode.clamp,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [lightPrimary, darkPrimary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    tileMode: TileMode.decal,
  );
}
