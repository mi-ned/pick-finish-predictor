import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';
import 'package:pick_finish_predictor_ui/widgets/app_action_buttons.dart';
import 'package:pick_finish_predictor_ui/widgets/app_icon_buttons.dart';
import 'package:pick_finish_predictor_ui/widgets/app_input_field.dart';
import 'package:pick_finish_predictor_ui/widgets/completion_time_card.dart';
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
                      top: style.headerVerticalPadding,
                      left: style.headerHorizontalPadding,
                      right: style.headerHorizontalPadding,
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
                      horizontal: style.bodyHorizontalPadding,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppInputField(
                          controller: timeController,
                          label: appStrings.promptCurrentTime,
                        ),
                        SizedBox(height: style.inputFieldSpacing),
                        AppInputField(
                          controller: itemsController,
                          label: appStrings.promptItemsRemaining,
                        ),
                        SizedBox(height: style.inputFieldSpacing),
                        AppInputField(
                          controller: pickersController,
                          label: appStrings.promptNumberOfPickers,
                        ),
                        SizedBox(height: style.inputFieldSpacing),
                        AppInputField(
                          controller: rateController,
                          label: appStrings.promptAveragePickRate,
                          errorText: appStrings.errorMessageCapacityZero, // test
                        ),
                      ],
                    ),
                  ),

                  
                  const Spacer(),

                  Padding(
                    padding: EdgeInsets.only(
                      left: 150,
                      right: 150,
                      //bottom: style.bottomBarPadding,
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
                      SizedBox(width: style.actionButtonGap),
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
                  height: MediaQuery.of(context).size.height * style.headerHeightMultiplier,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColours.secondaryBackgroundLite,
                        AppColours.secondaryBackgroundDark,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: style.headerHorizontalPadding,
                    vertical: style.headerVerticalPadding,
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
                        SizedBox(height: style.inputFieldSpacing),
                        CompletionTimeCard(
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