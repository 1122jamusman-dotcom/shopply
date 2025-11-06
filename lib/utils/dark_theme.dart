import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoply/utils/theme_config.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    toolbarTextStyle: ThemeData.light().textTheme.displayMedium!.copyWith(
      fontFamily: ThemeConfig.pangramRegular,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  textTheme: ThemeData.dark().textTheme.copyWith(
    headlineLarge: GoogleFonts.poppins(color: Colors.white, fontSize: 26),
    titleMedium: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
    titleSmall: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
    bodyLarge: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
    bodyMedium: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (states) => Colors.white.withValues(alpha: .3),
    ),
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    secondary: const Color(0xff73777a),
    primary: Colors.white,
    onPrimary: const Color(0xffA0A0A0),
    outline: Colors.black,
    onSurface: const Color(0xff202934),
    brightness: Brightness.dark,
    surface: const Color(0xff202934),
    primaryContainer: const Color(0xff2d3236),
    onPrimaryContainer: const Color(0xff5a5f62),
    secondaryContainer: ThemeConfig.leadingColorD45555,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearTrackColor: Colors.white,
    color: ThemeConfig.primaryColor,
  ),
  primaryColor: ThemeConfig.primaryColor,
  scaffoldBackgroundColor: ThemeConfig.darkBackColor,

  switchTheme: SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(Colors.blue),
    trackColor: WidgetStatePropertyAll(Colors.amberAccent),
    overlayColor: WidgetStatePropertyAll(Colors.amber.withValues(alpha: .2)),
    mouseCursor: WidgetStatePropertyAll(SystemMouseCursors.click),
  ),
);
