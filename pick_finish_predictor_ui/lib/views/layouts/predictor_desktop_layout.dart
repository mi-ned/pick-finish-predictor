import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';
import 'package:pick_finish_predictor_ui/widgets/app_action_button.dart';
import 'package:pick_finish_predictor_ui/widgets/app_icon_button.dart';
import 'package:pick_finish_predictor_ui/widgets/app_text_field.dart';
import 'package:pick_finish_predictor_ui/widgets/time_card.dart';
import 'package:pick_finish_predictor_ui/widgets/history_card.dart';

class PredictorDesktopLayout extends StatelessWidget {
  final AppStrings appStrings;

  // menu buttons
  final VoidCallback onMenu;
  final VoidCallback onHelp;
  final VoidCallback onHistory;
  final VoidCallback onMode;

  // left side
  // text edits
  final TextEditingController timeController;
  final TextEditingController itemsController;
  final TextEditingController pickersController;
  final TextEditingController rateController;

  // buttons
  final VoidCallback onClear;
  final VoidCallback onCalculate;

  // right side
  // card view
  final String estimatedTime;
  final bool isCalculated;
  final bool isOver24Hrs;

  const PredictorDesktopLayout({
    super.key,
    required this.appStrings,
    required this.onMenu,
    required this.onHelp,
    required this.onHistory,
    required this.onMode,
    required this.timeController,
    required this.itemsController,
    required this.pickersController,
    required this.rateController,
    required this.onClear,
    required this.onCalculate,
    required this.estimatedTime,
    required this.isCalculated,
    required this.isOver24Hrs,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppStyle.of(context);

    return Scaffold(
      backgroundColor: AppColours.primaryBackground,
      body: Row(
        children: [
          // Left side
          Expanded(
            flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: style.iconButtonVerticalPadding,
                      left: style.iconButtonHorizontalPadding,
                      right: style.iconButtonHorizontalPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuIconButton(
                          tooltip: appStrings.tooltipMenu,
                          onPressed: onMenu,
                        ),
                        HelpIconButton(
                          tooltip: appStrings.tooltipHelp,
                          onPressed: onHelp,
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: style.textFieldHorizontalMargin,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextField(
                          controller: timeController,
                          label: appStrings.promptCurrentTime,
                        ),
                        SizedBox(height: style.textFieldSpacing),
                        AppTextField(
                          controller: itemsController,
                          label: appStrings.promptItemsRemaining,
                        ),
                        SizedBox(height: style.textFieldSpacing),
                        AppTextField(
                          controller: pickersController,
                          label: appStrings.promptNumberOfPickers,
                        ),
                        SizedBox(height: style.textFieldSpacing),
                        AppTextField(
                          controller: rateController,
                          label: appStrings.promptAveragePickRate,
                          //errorText: appStrings.errorMessageCapacityZero,
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  Padding(
                    padding: EdgeInsets.only(
                      left: style.actionButtonHorizontalMargin,
                      right: style.actionButtonHorizontalMargin,
                    ),
                    child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClearButton(
                          strings: appStrings,
                          onPressed: onClear,
                        ),
                      ),
                      SizedBox(width: style.actionButtonRowSpacing),
                      Expanded(
                        flex: 2,
                        child: CalculateButton(
                          strings: appStrings,
                          onPressed: onCalculate,
                        ),
                      ),
                    ],
                  ),

                  
                ),
                const Spacer(),
              ],
            ),
          ),

          // Right side
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // Top Container: Teal Completion Time Section
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * style.timeCardHeightMultiplier,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColours.secondaryBackgroundLight,
                        AppColours.secondaryBackgroundDark,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: style.iconButtonHorizontalPadding,
                    vertical: style.iconButtonVerticalPadding,
                  ),
                  child: SafeArea(
                    left: false,
                    bottom: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Top Button Bar: Centered History, Far Right Mode
                        Row(
                          children: [
                            const Spacer(),
                            HistoryIconButton(
                              tooltip: appStrings.tooltipHistory,
                              onPressed: onHistory,
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: ModeIconButton(
                                  tooltip: appStrings.tooltipSelectMode,
                                  onPressed: onMode,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: style.textFieldSpacing),
                        TimeCard(
                          estimatedTime: estimatedTime,
                          isCalculated: isCalculated,
                          isOver24Hrs: isOver24Hrs,
                          appStrings: appStrings,
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Container: Flat History List
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: AppColours.primaryBackground,
                    child: HistoryCard(
                      appStrings: appStrings,
                      isTablet: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}