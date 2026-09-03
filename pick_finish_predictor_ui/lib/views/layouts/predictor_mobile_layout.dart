import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';
import 'package:pick_finish_predictor_ui/widgets/app_action_buttons.dart';
import 'package:pick_finish_predictor_ui/widgets/app_icon_buttons.dart';
import 'package:pick_finish_predictor_ui/widgets/app_input_field.dart';
import 'package:pick_finish_predictor_ui/widgets/completion_time_card.dart';

class PredictorMobileLayout extends StatelessWidget{

  final AppStrings appStrings;

  //menu buttons
  final VoidCallback onMenu;
  final VoidCallback onHelp;
  final VoidCallback onHistory;
  final VoidCallback onMode;
  
  //card view
  final String estimatedTime;
  final bool isCalculated;
  final bool isOver24Hrs;

  //text edits
  final TextEditingController timeController;
  final TextEditingController itemsController;
  final TextEditingController pickersController;
  final TextEditingController rateController;

  //buttons
  final VoidCallback onClear;
  final VoidCallback onCalculate;

  const PredictorMobileLayout({
    super.key, 
    required this.appStrings, 
    required this.onMenu,
    required this.onHelp, 
    required this.onHistory, 
    required this.onMode, 
    required this.estimatedTime, 
    required this.isCalculated, 
    required this.isOver24Hrs, 
    required this.timeController, 
    required this.itemsController, 
    required this.pickersController, 
    required this.rateController, 
    required this.onClear, 
    required this.onCalculate
  });

  @override
  Widget build(BuildContext context) {

    final style = AppStyle.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColours.primaryBackground,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * style.headerHeightMultiplier,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColours.secondaryBackgroundLite, AppColours.secondaryBackgroundDark], 
                begin: Alignment.topCenter, 
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(style.radiusCompletionTimeCard),
                bottomRight: Radius.circular(style.radiusCompletionTimeCard),
              ),
            ),
            //teal parts (< notch area)
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: style.headerHorizontalPadding, vertical: style.headerVerticalPadding),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //main menu
                      MenuIconButton(
                        tooltip: appStrings.tooltipMenu,
                        onPressed: onMenu,
                      ),
                      
                      const Spacer(),

                      HelpIconButton(
                        tooltip: appStrings.tooltipHelp,
                        onPressed: onHelp,
                      ),

                      const Spacer(),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            HistoryIconButton(
                              tooltip: appStrings.tooltipHistory,
                              onPressed: onHistory,
                            ),
                            
                            ModeIconButton(
                              tooltip: appStrings.tooltipSelectMode,
                              onPressed: onMode,
                            ),
                        ],
                      ),
                    ],
                  ),

                 const Spacer(),
                //const SizedBox(height: 16),

                  //Expanded(
                    //child: Center(
                    //child: 
                    CompletionTimeCard(
                      estimatedTime: estimatedTime,
                      isCalculated: isCalculated,
                      isOver24Hrs: isOver24Hrs,
                      appStrings: appStrings,
                    ),
                    //),
                  //),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ),

          //Middle part
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: style.bodyHorizontalPadding, vertical: style.bodyVerticalPadding),
              child: Column(
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
                    errorText: appStrings.errorMessageCapacityZero,//test
                  ),
                ],
              ),
            ),
          ),

          //Bottom buttons (> Home indicator)
          SafeArea(
            bottom: true,
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: style.bodyHorizontalPadding, 
                vertical: style.bodyVerticalPadding),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClearButton(
                        strings: appStrings, 
                        onPressed: onClear,
                        ),
                      ),
                      SizedBox(width: style.actionButtonGap,),
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
                ),
              ],
            ),
          );
  }
}