import 'package:flutter/material.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/core/values/text.styles.dart';

class InputDecorationUtils{

  static InputDecoration outLineText(
      {String labelText = "",
        String? hintText="",
        Widget? suffixIcon,
        Widget? prefixIcon,
        Color? backgroundColor}) {
    return InputDecoration(
      filled: true,
      counterText: "",
      labelText: labelText,
      hintText: hintText,
      hintStyle: bodyMedium,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: backgroundColor ?? Theme.of(NavigationService.context).scaffoldBackgroundColor,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(10.0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.transparent)),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(style: BorderStyle.solid)));
  }

}