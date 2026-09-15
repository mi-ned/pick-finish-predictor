
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

    final borderRadius = isTablet ? BorderRadius.vertical(top: Radius.circular(style.historyCardBorderRadius),): BorderRadius.zero;

    final content = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColours.historyCardPrimaryBackground,
        borderRadius: borderRadius,
      ),
      child: Column(
        children: [
          if(isTablet) ... [
            SizedBox(height: style.historyCardHandlePillContentPadding),
            Center(
              child: Container(
                width: style.historyCardHandlePillWidth,
                height: style.historyCardHandlePillHeight,
                decoration: BoxDecoration(
                  color: AppColours.historyCardSliderBackground,
                  borderRadius: BorderRadius.circular(style.historyCardHandlePillBorderRadius),
                ),
              ),
            ),
            SizedBox(height: style.historyCardHandlePillSpacing),
          ],
          Expanded(
            child: ListView(
              
              padding: EdgeInsets.symmetric(
                horizontal: style.historyCardHorizontalMargin,
                vertical: style.historyCardVerticalMargin,
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
                  ),
              ],
            ),
          ),
      ],
      ),
    );

    if(isTablet){
      return ClipRRect(borderRadius: borderRadius, child: content,);
    }

    return content;
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
            color: AppColours.historyCardSecondaryForeground,
            fontSize: style.historyCardTimelineFontSize,
            fontFamily: 'Verdana',
          ),
        ),
        SizedBox(height: style.historyCardElementSpacing),
        Text(
          "Time recorded: $timeRecorded",
          style: TextStyle(
            color: AppColours.historyCardSecondaryForeground,
            fontSize: style.historyCardTimeRecordedFontSize,
            fontFamily: 'Verdana',
          ),
        ),
        SizedBox(height: style.historyCardElementSpacing),
        Text(
          resultTime,
          style: TextStyle(
            color: AppColours.historyCardPrimaryForeground,
            fontSize: style.historyCardResultTimeFontSize,
            fontFamily: 'Verdana',
          ),
        ),
        if(showDivider) ...[
          SizedBox(height: style.historyCardLastElementSpacing),
          Divider(color: AppColours.historyCardDividerBackground, height: style.historyCardDividerHeight),
          SizedBox(height: style.historyCardItemSpacing)
        ],
      ],
    );
  }

}