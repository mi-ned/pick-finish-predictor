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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColours.secondaryBackgroundLite,
            AppColours.secondaryBackgroundDark,
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        )
        ,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            appStrings.headerEstimatedCompletionTime,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontFamily: 'Verdana',
            ),
          ),
          //const SizedBox(height: 8),
          Text(
            estimatedTime,
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
              fontFamily: 'Verdana',
            ),
          ),
          Text(
            appStrings.warningMessageExploitativeWorkload,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontFamily: 'Verdana',
            ),
          ),
        ],
      ),
    );
  }
}