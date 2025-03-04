
import 'package:flutter/material.dart';
import 'package:open_library/core/values/globals.dart';

final ThemeData appDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Globals.themeDark,
    applyElevationOverlayColor: true,
    primaryColor: Globals.themeDark,
    splashColor: Globals.primaryColor,
    primaryColorLight: Globals.primaryColor,
    focusColor: Globals.secondaryColor,
    dividerColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        color: Globals.secondaryColor,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 10,
        elevation: 4),
    hoverColor: Colors.cyanAccent[100],
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 255, 254, 254),
      size: 25
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Globals.primaryColor
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12))),
    dividerTheme: const DividerThemeData(indent: 20, color: Colors.grey),
    scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: WidgetStateProperty.all<bool>(true)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        sizeConstraints: BoxConstraints(
            maxHeight: 120, maxWidth: 120, minHeight: 50, minWidth: 50),
        backgroundColor: Colors.white38),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      hoverColor: Colors.yellowAccent,
      filled: true,
      alignLabelWithHint: true,
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(25)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(25)),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.redAccent.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(25)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
          borderRadius: BorderRadius.circular(25)),
    ),
    primaryIconTheme: const IconThemeData(
        color: Color.fromARGB(255, 255, 255, 255), size: 25),
    fontFamily: 'Helvetica',
    textTheme: const TextTheme(
      titleLarge:
          TextStyle(fontSize: 25.0, color: Color.fromARGB(255, 255, 255, 255)),
      titleMedium:
          TextStyle(fontSize: 22.0, color: Color.fromARGB(255, 251, 251, 251)),
      titleSmall:
          TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 255, 255, 255)),
      labelLarge: TextStyle(
          fontSize: 16.0, color: Colors.black, fontStyle: FontStyle.italic),
      labelMedium: TextStyle(fontSize: 14.0, color: Colors.black),
      labelSmall: TextStyle(fontSize: 8.0, color: Colors.black),
    ));
