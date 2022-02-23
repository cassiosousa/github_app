import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

final themeLight = ThemeData(
  textTheme: GoogleFonts.rubikTextTheme(
    const TextTheme(
      headline1: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Color(0xFF070417),
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
      headline6: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFF070417),
      ),
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        fontSize: 10,
        color: Colors.deepPurple,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.black),
  cardTheme: CardTheme(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(.2),
      shape: ShapeDecoration.fromBoxDecoration(
        BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ).shape),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepPurple,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  primaryColor: Colors.deepPurple,
  indicatorColor: Colors.deepPurple,
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: Colors.deepPurple),
);
