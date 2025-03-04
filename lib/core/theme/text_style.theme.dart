import 'package:flutter/material.dart';

class CustomTextStyles extends TextTheme {

  @override
  TextStyle? get bodyLarge => null;

  @override
  TextStyle? get bodyMedium => null;

  @override
  TextStyle? get bodySmall => null;

  @override
  TextStyle? get displayLarge => null;

  @override
  TextStyle? get displayMedium => null;

  @override
  TextStyle? get displaySmall => null;

  @override
  TextStyle? get headlineLarge => null;

  @override
  TextStyle? get headlineMedium => null;

  @override
  TextStyle? get headlineSmall => null;

  @override
  TextStyle? get labelLarge => const TextStyle(fontSize: 22, color: Colors.black,inherit: true,fontWeight: FontWeight.bold);

  @override
  TextStyle? get labelMedium => const TextStyle(fontSize: 14, color: Colors.black);

  @override
  TextStyle? get labelSmall => null;

  @override
  TextStyle? get titleSmall => null;

  @override
  TextStyle? get titleLarge => const TextStyle(fontSize: 32,color: Colors.black,inherit: true,fontWeight: FontWeight.bold);

  @override
  TextStyle? get titleMedium => const TextStyle(fontSize: 18, color: Colors.black, overflow: TextOverflow.ellipsis);
}