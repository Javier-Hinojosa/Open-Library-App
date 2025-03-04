import 'package:flutter/material.dart';
import 'package:open_library/core/theme/material_state_property.theme.dart';
import 'package:open_library/core/theme/text_style.theme.dart';
import 'package:open_library/core/values/globals.dart';

final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.highContrastLight(
        primaryContainer: Colors.transparent,
        surface: Globals.backgroundColor,
        primary: Globals.primaryColor,
        secondary: Globals.secondaryColor),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Globals.backgroundColor,
    cardColor:  Globals.backgroundColor.withValues(alpha: 1),
    sliderTheme: const SliderThemeData(activeTrackColor: Colors.white),
    primaryColor: Globals.primaryColor,
    dividerColor: Globals.backgroundColor,
    canvasColor: Colors.grey.shade300,
    timePickerTheme: const TimePickerThemeData(
        backgroundColor: Globals.backgroundColor
    ),
    primaryColorDark: Colors.black45,
    checkboxTheme: CheckboxThemeData(
        fillColor: principalColor()),
    iconTheme: const IconThemeData(color: Colors.black87),
    dialogTheme: DialogTheme(backgroundColor: Colors.black45),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Globals.primaryColor),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.black,
        linearMinHeight: 5,
        refreshBackgroundColor: Colors.black),
    iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: WidgetStateProperty.all<Color>(Colors.black87))),
    dividerTheme: const DividerThemeData(color: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: principalColor())),
    chipTheme:   ChipThemeData(
        backgroundColor: Globals.backgroundColor,
        labelStyle: CustomTextStyles().labelMedium!.apply(color: Colors.white),
        selectedColor: Globals.primaryColor,
        shape: const RoundedRectangleBorder(
            side: BorderSide(width: 2),
            borderRadius: BorderRadius.all(Radius.circular(30)))),
    inputDecorationTheme: const InputDecorationTheme(
        suffixIconColor: Colors.black54,
        prefixIconColor: Colors.black45
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Globals.backgroundColor),
    textTheme: CustomTextStyles()
);