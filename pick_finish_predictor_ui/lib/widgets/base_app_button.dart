
import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';

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

  final double defaultElevation;

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
    this.defaultElevation = 2.0,
  });

  @override
  Widget build(BuildContext context) {

    AppStyle style = AppStyle.of(context);

    final bool active = isEnabled && onPressed != null;

    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(style.actionButtonHeight),
        shadowColor: active ? null : Colors.transparent,
      ).copyWith(
        elevation: WidgetStateProperty.resolveWith((states){
          if(states.contains(WidgetState.disabled)){
            return 0.0;
          }
          if(states.contains(WidgetState.pressed)){
            return defaultElevation / 2;
          }
          return defaultElevation;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if(states.contains(WidgetState.disabled)){
            return bgDisabled;
          }
          if(states.contains(WidgetState.pressed)){
            return bgPressed;
          }
          return bgEnabled;
        }),
        
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.disabled)){
          return fgDisabled;
        }
        if(states.contains(WidgetState.pressed)){
          return fgPressed;
        }

        return fgEnabled;
      }),
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