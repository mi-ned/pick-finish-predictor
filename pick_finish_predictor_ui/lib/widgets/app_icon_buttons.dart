import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final Color? color;
  final double iconSize;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    this.onPressed,
    this.color,
    this.iconSize = 24,
    });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color ?? Colors.white,
      tooltip: tooltip,
      onPressed: onPressed,
      splashRadius: iconSize + 8,
    );
  }
}

class MenuIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double iconSize;

  const MenuIconButton({super.key, this.onPressed, this.iconSize = 24.0});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.menu_rounded,
      tooltip: 'Menu',
      onPressed: onPressed,
      iconSize: iconSize,
    );
  }
}

class HelpIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double iconSize;
  const HelpIconButton({super.key, this.onPressed, this.iconSize = 24.0});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.help,
      tooltip: 'Help',
      onPressed: onPressed,
      iconSize: iconSize,
    );
  }
}

class HistoryIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double iconSize;
  const HistoryIconButton({super.key, this.onPressed, this.iconSize = 24.0});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.history,
      tooltip: 'History',
      onPressed: onPressed,
      iconSize: iconSize,
    );
  }
}

class ModeIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double iconSize;
  const ModeIconButton({super.key, this.onPressed, this.iconSize = 24.0});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.calculate,
      tooltip: 'Select Mode',
      onPressed: onPressed,
      iconSize: iconSize,
    );
  }
}