import 'package:flutter/material.dart';
import 'package:petroleum/src/ui/colors.dart';

appTheme() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.periwinkle,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.bgColor,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFD0CBF6),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.bgColor,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 42,
        letterSpacing: _letterSpacingFromPercent(-5),
        height: _lineHeightFromPercent(94),
        color: AppColors.periwinkle,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        letterSpacing: _letterSpacingFromPercent(0),
        height: _lineHeightFromPercent(100),
        // color: Color(0xFF5340DD),
        color: AppColors.periwinkle,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

_lineHeightFromPercent(int i) {
  return i / 100;
}

_letterSpacingFromPercent(int i) {
  return i / 100;
}
