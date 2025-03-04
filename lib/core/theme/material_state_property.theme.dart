import 'package:flutter/material.dart';
import 'package:open_library/core/values/globals.dart';



 WidgetStateProperty<Color> principalColor ()=>WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  if (states.contains(WidgetState.pressed)) {
    return Globals.primaryColor.withValues(alpha: 0.6);
  } else if (states.contains(WidgetState.disabled)) {
    return Colors.grey;
  }
  else if (states.contains(WidgetState.selected)) {
    return Globals.primaryColor;
  }
  else if (states.contains(WidgetState.error)) {
    return Colors.redAccent;
  }
  else if (states.contains(WidgetState.dragged)) {
    return Colors.grey;
  }
  return Globals.primaryColor; // Color por defecto
});
