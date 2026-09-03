
import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';
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
    final style = AppStyle.of(context);

    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(80,style.actionButtonHeight)),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: style.actionButtonHorizontalPadding, vertical: style.actionButtonVerticalPadding),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(style.actionButtonHeight/2)),
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
      style: TextStyle(
        fontFamily: 'Verdana',
        fontSize: style.actionButtonFontSize,
        fontWeight: FontWeight.normal,
      )
    ),
    );
  }
}