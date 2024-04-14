import "package:dial_verse/core/constants/index.dart";
import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/material.dart";

abstract class AppTheme {
  static const String fontAudioWide = "AudioWide";
  static const String fontChango = "Chango";
  static const String fontCaviar = "Caviar";

  static InputBorder _border({Color color = AppPalette.primary}) =>
      OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: color),
        borderRadius: BorderRadius.circular(AppDimensions.inputFieldRadius),
      );

  static ThemeData get theme => ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.primary),
        scaffoldBackgroundColor: AppPalette.white,
        textTheme: Typography().black.apply(
              fontFamily: fontCaviar,
            ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppPalette.transparent,
          shadowColor: AppPalette.transparent,
          surfaceTintColor: AppPalette.lightPrimary.withOpacity(0.2),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(),
          errorBorder: _border(color: AppPalette.red),
          contentPadding: const EdgeInsets.all(12.0),
        ),
      );
}
