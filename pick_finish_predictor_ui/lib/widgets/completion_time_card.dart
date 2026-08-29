import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';

class CompletionTimeCard extends StatelessWidget {
  final String estimatedTime;
  final bool isCalculated;
  final bool isOver24Hrs;
  final AppStrings appStrings;

  const CompletionTimeCard({
    super.key,
    required this.estimatedTime,
    this.isCalculated = false,
    this.isOver24Hrs = false,
    required this.appStrings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appStrings.headerEstimatedCompletionTime,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Verdana',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          estimatedTime,
          style: TextStyle(
            color: Colors.white,
            fontSize: 64,
            fontWeight: FontWeight.normal,
            fontFamily: 'Verdana',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          appStrings.warningMessageExploitativeWorkload,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Verdana',
          ),
        ),
        //const SizedBox(height: 8),
      ],
    );
  }
}