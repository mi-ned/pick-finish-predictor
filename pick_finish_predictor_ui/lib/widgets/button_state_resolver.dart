import 'package:flutter/material.dart';

abstract class ButtonStateResolver {

  static WidgetStateProperty<Color> resolveBackground({
    required Color enabled,
    required Color pressed,
    required Color disabled,
  }) {
  return WidgetStateProperty.resolveWith<Color>((states) {
    if(states.contains(WidgetState.disabled)) return disabled;
    if(states.contains(WidgetState.pressed)) return pressed;
    return enabled;
  });
}

static WidgetStateProperty<Color> resolveForeground({
    required Color enabled,
    required Color pressed,
    required Color disabled,
  }) {
  return WidgetStateProperty.resolveWith<Color>((states) {
    if(states.contains(WidgetState.disabled)) return disabled;
    if(states.contains(WidgetState.pressed)) return pressed;
    return enabled;
  });
}
}