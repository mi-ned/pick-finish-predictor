
import 'package:flutter/material.dart';
import 'button_state_resolver.dart';

class BaseAppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;

  final Color bgEnabled;
  final Color bgPressed;
  final Color bgDisabled;

  final Color fgEnabled;
  final Color fgPressed;
  final Color fgDisabled;

  const BaseAppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    required this.bgEnabled,
    required this.bgPressed,
    required this.bgDisabled,
    required this.fgEnabled,
    required this.fgPressed,
    required this.fgDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(80,50)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      elevation: WidgetStateProperty.all(0),
      backgroundColor: ButtonStateResolver.resolveBackground(
        enabled: bgEnabled, 
        pressed: bgPressed, 
        disabled: bgDisabled,
      ),
      foregroundColor: ButtonStateResolver.resolveForeground(
        enabled: fgEnabled,
        pressed: fgPressed,
        disabled: fgDisabled,
      ),
    ),
    child: Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontFamily: 'Verdana',
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      )
    ),
    );
  }
}