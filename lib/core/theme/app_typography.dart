import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  static final String fontFamily = GoogleFonts.hankenGrotesk().fontFamily ?? 'Hanken Grotesk';

  static TextStyle get displayLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 34.sp,
        fontWeight: FontWeight.w700,
        height: 42 / 34,
        letterSpacing: -0.02.em,
      );

  static TextStyle get headlineLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        height: 34 / 28,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontFamily: fontFamily,
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        height: 28 / 22,
        letterSpacing: -0.01.em,
      );

  static TextStyle get headlineSmall => TextStyle(
        fontFamily: fontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: 24 / 18,
      );

  static TextStyle get bodyLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
      );

  static TextStyle get labelSmall => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
        letterSpacing: 0.05.em,
      );

  static TextTheme getTextTheme() {
    return TextTheme(
      displayLarge: displayLarge,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      labelSmall: labelSmall,
    );
  }
}

extension DoubleExtension on double {
  double get em => this * 16.0;
}
