import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.amber,
      fontFamily: GoogleFonts.lato().fontFamily,
      // cardColor: Colors.white,
      // canvasColor: creamColor,
      // buttonTheme: ButtonThemeData(buttonColor: lightBluishColor),
      colorScheme: ColorScheme.light(
          background: creamColor,
          primary: Colors.white,
          secondary: darkBluishColor),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      brightness: Brightness.dark,
      // cardColor: Colors.black,
      // canvasColor: darkCreamColor,
      colorScheme: ColorScheme.dark(
          background: darkCreamColor,
          primary: Colors.black,
          secondary: lightBluishColor),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ));

  //colors
  static Color creamColor = const Color(0xFFEBEAEF);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
