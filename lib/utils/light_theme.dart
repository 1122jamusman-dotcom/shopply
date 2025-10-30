import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoply/utils/theme_config.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
    secondary: const Color(0xffa1a1a1),
    primary: const Color(0xff0F0425),
    onPrimary: const Color(0xff9694B8),
    outline: const Color(0xfff0f0f0),
    onSurface: const Color(0xfff6f8f8),
    surface: const Color(0xffDCE8E8),
    primaryContainer: Colors.white,
    onPrimaryContainer: const Color(0xffd8d8da),
    secondaryContainer: ThemeConfig.leadingColorD45555,
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearTrackColor: Color(0xffECEAEA),
    color: ThemeConfig.primaryColor,
  ),
  primaryColor: ThemeConfig.primaryColor,
  radioTheme: RadioThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (states) => Colors.black.withValues(alpha: .4),
    ),
  ),

  textTheme: ThemeData.light().textTheme.copyWith(
    headlineLarge: GoogleFonts.poppins(color: Colors.black, fontSize: 26),
    titleMedium: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
    titleSmall: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
    bodyLarge: GoogleFonts.poppins(color: Color(0xff9D9D9D), fontSize: 16),
    bodyMedium: GoogleFonts.poppins(color: Color(0xff9D9D9D), fontSize: 14),
  ),
);
