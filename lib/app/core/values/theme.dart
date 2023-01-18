import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF00BAC6);
  static const Color secondaryColor = Color(0xFF072728);
  static const Color tertiaryColor = Color(0xFFE9F4F4);
  static const Color alternate = Color(0xFF006F72);
  static const Color primaryBackground = Color(0xFFBCE102);
  static const Color secondaryBackground = Color(0xFFFFFFFF);
  static const Color primaryText = Color(0xFF072728);
  static const Color secondaryText = Color(0xFF57636C);

  static const Color primaryBtnText = Color(0xFFFFFFFF);
  static const Color lineColor = Color(0xFFE0E3E7);
  static const Color backgroundPage = Color(0xFFEBEBEB);
  static const Color grayIcon = Color(0xFF95A1AC);
  static const Color gray200 = Color(0xFFDBE2E7);
  static const Color gray600 = Color(0xFF262D34);
  static const Color black600 = Color(0xFF090F13);
  static const Color tertiary400 = Color(0xFF39D2C0);
  static const Color textColor = Color(0xFF1E2429);
}

class AppTextStyles {
  static final TextStyle bodyText1 = GoogleFonts.getFont(
    'Heebo',
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static final TextStyle bodyText2 = GoogleFonts.getFont(
    'Heebo',
    color: AppColors.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
