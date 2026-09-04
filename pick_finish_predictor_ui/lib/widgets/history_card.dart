
import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';

class HistoryCard extends StatelessWidget {

  final AppStrings appStrings;
  final bool isTablet;

  const HistoryCard({
    super.key,
    required this.appStrings,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppStyle.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColours.tileBackground,
        borderRadius: isTablet
          ? BorderRadius.vertical(top: Radius.circular(style.radiusCompletionTimeCard))
          : BorderRadius.zero,
      ),
      child: Column(
        children: [
          if(isTablet) ... [
            const SizedBox(height: 20), //style.handlePillSpace
            Center(
              child: Container(
                width: 30, //style.handlePillWidth
                height: 5, //style.handlePillHeight
                decoration: BoxDecoration(
                  color: AppColours.sliderBackground,
                  borderRadius: BorderRadius.circular(25), //style.handlePillRadius
                ),
              ),
            ),
            const SizedBox(height: 8), //style.handlePillSpacing
          ],
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: style.bodyHorizontalPadding,
                vertical: style.bodyVerticalPadding,
              ),
              children: [
                //dummy values
                _buildHistoryListView(
                  timeline: 'Today', 
                  timeRecorded: '2:30pm', 
                  resultTime: '17:38', 
                  style: style,
                  ),
                  _buildHistoryListView(
                  timeline: 'Yesterday', 
                  timeRecorded: '17:38', 
                  resultTime: '17:39', 
                  style: style,
                  ),
                  _buildHistoryListView(
                  timeline: 'Previous 7 Days', 
                  timeRecorded: '11:00am', 
                  resultTime: '22:03 (+1 day)', 
                  style: style,
                  showDivider: false,
                  ),
              ],
            ),
          ),
      ],)
    );
  }

  Widget _buildHistoryListView({
    required String timeline,
    required String timeRecorded,
    required String resultTime,
    bool showDivider = true,
    required AppStyle style,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          timeline,
          style: TextStyle(
            color: AppColours.tileForegroundSecondary,
            fontSize: style.timelineFontSizeHistoryCard,
            fontFamily: 'Verdana',
          ),
        ),
        const SizedBox(height: 4), //experiment
        Text(
          timeRecorded,
          style: TextStyle(
            color: AppColours.tileForegroundSecondary,
            fontSize: style.timeRecordedFontSizeHistoryCard,
            fontFamily: 'Verdana',
          ),
        ),
        const SizedBox(height: 6), //experiment
        Text(
          resultTime,
          style: TextStyle(
            color: AppColours.tileForegroundPrimary,
            fontSize: style.resultTimeFontSizeHistoryCard,
            fontFamily: 'Verdana',
          ),
        ),
        if(showDivider) ...[
          const SizedBox(height: 12), //experiment
          const Divider(color: AppColours.dividerBackground, height: 1),
          SizedBox(height: style.inputFieldSpacing) //experiment
        ],
      ],
    );
  }

}