import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';
import 'package:pick_finish_predictor_ui/views/layouts/help_content_view.dart';

class HelpContentSheet extends StatelessWidget {
  final AppStrings strings;
  final AppStyle style;
  final VoidCallback? onClose;

  const HelpContentSheet({
    super.key,
    required this.strings,
    required this.style,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(style.helpContentSheetVerticalBorderRadius),
      ),
      child: HelpContentView(
        strings: strings,
        style: style,
        onClose: onClose ?? () => Navigator.of(context).pop(),
        showDragHandle: true,
      ),
    );
  }
}