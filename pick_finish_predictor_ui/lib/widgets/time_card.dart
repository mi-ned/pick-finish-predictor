import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';

class TimeCard extends StatelessWidget {
  final String estimatedTime;
  final bool isCalculated;
  final bool isOver24Hrs;
  final AppStrings appStrings;

  const TimeCard({
    super.key,
    required this.estimatedTime,
    this.isCalculated = false,
    this.isOver24Hrs = false,
    required this.appStrings,
  });

  @override
  Widget build(BuildContext context) {

    final style = AppStyle.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appStrings.headerEstimatedCompletionTime,
          style: TextStyle(
            color: Colors.white,
            fontSize: style.timeCardTitleFontSize,
            fontFamily: 'Verdana',
          ),
        ),
        SizedBox(height: style.timeCardSpacing),
        Text(
          estimatedTime,
          style: TextStyle(
            color: Colors.white,
            fontSize: style.timeCardEstimateFontSize,
            fontWeight: FontWeight.normal,
            fontFamily: 'Verdana',
          ),
        ),

        if(isOver24Hrs) ...[
          SizedBox(height: style.timeCardSpacing),
          Text(
            appStrings.warningMessageExploitativeWorkload,
            style: TextStyle(
              color: Colors.white,
              fontSize: style.timeCardFooterFontSize,
              fontFamily: 'Verdana',
            ),
          ),
        ]
      ],
    );
  }
}