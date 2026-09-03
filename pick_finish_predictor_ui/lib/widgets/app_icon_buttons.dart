import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';

class AppIconButton extends StatelessWidget {

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final Color? color;
  final double? iconSize;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    this.onPressed,
    this.color,
    this.iconSize,
    });

  @override
  Widget build(BuildContext context) {

    final double effectiveIconSize = iconSize ?? AppStyle.of(context).headerIconSize;

    return IconButton(
      icon: Icon(
        icon,
        size: effectiveIconSize,
        ),
      color: color ?? Colors.white,
      tooltip: tooltip,
      onPressed: onPressed,
      constraints: BoxConstraints(
        minWidth: effectiveIconSize * 1.125,
        minHeight: effectiveIconSize * 1.125,
      )
    );
  }
}

class MenuIconButton extends StatelessWidget {
  final String tooltip;
  final VoidCallback? onPressed;
  final double? iconSize;

  const MenuIconButton({
    super.key, 
    required this.tooltip, 
    this.onPressed, 
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.menu_rounded,
      tooltip: tooltip,
      onPressed: onPressed,
      iconSize: iconSize,
    );
  }
}

class HelpIconButton extends StatelessWidget {
  final String tooltip;
  final VoidCallback? onPressed;
  final double? iconSize;

  const HelpIconButton({
    super.key, 
    required this.tooltip, 
    this.onPressed, 
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.help,
      tooltip: tooltip,
      onPressed: onPressed,
      iconSize: iconSize,
    );
  }
}

class HistoryIconButton extends StatelessWidget {
  
  final String tooltip;
  final VoidCallback? onPressed;
  final double? iconSize;

  const HistoryIconButton({
    super.key, 
    required this.tooltip, 
    this.onPressed, 
    this.iconSize,
    });

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.history_rounded,
      tooltip: tooltip,
      onPressed: onPressed,
      iconSize: iconSize,
    );
  }
}

class ModeIconButton extends StatelessWidget {
  final String tooltip;
  final VoidCallback? onPressed;
  final double? iconSize;

  const ModeIconButton({
    super.key, 
    required this.tooltip,
    this.onPressed,
    this.iconSize,
    
    });

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.calculate,
      tooltip: tooltip,
      onPressed: onPressed,
      iconSize: iconSize,
    );
  }
}