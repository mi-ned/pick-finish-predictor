import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/widgets/base_app_button.dart';

class CalculateButton extends StatelessWidget {
  final AppStrings strings;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const CalculateButton({
    super.key,
    required this.strings,
    required this.onPressed,
    this.isEnabled = true,
  });


  @override
  Widget build(BuildContext context) {
    return BaseAppButton(
      text: strings.calculateButton,
      onPressed: onPressed,
      isEnabled: isEnabled,
      bgEnabled: AppColours.calculateButtonBackgroundEnabled,
      bgPressed: AppColours.calculateButtonBackgroundPressed,
      bgDisabled: AppColours.calculateButtonBackgroundDisabled,
      fgEnabled: AppColours.calculateButtonForegroundEnabled,
      fgPressed: AppColours.calculateButtonForegroundPressed,
      fgDisabled: AppColours.calculateButtonForegroundDisabled,
    );
  }
}

class ClearButton extends StatelessWidget {
  final AppStrings strings;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const ClearButton({
    super.key,
    required this.strings,
    required this.onPressed,
    this.isEnabled = true,
  });


  @override
  Widget build(BuildContext context) {
    return BaseAppButton(
      text: strings.clearButton,
      onPressed: onPressed,
      isEnabled: isEnabled,
      bgEnabled: AppColours.clearButtonBackgroundEnabled,
      bgPressed: AppColours.clearButtonBackgroundPressed,
      bgDisabled: AppColours.clearButtonBackgroundDisabled,
      fgEnabled: AppColours.clearButtonForegroundEnabled,
      fgPressed: AppColours.clearButtonForegroundPressed,
      fgDisabled: AppColours.clearButtonForegroundDisabled,
    );
  }
}