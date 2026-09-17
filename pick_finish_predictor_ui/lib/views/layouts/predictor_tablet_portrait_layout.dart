import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';
import 'package:pick_finish_predictor_ui/widgets/app_action_button.dart';
import 'package:pick_finish_predictor_ui/widgets/app_icon_button.dart';
import 'package:pick_finish_predictor_ui/widgets/app_text_field.dart';
import 'package:pick_finish_predictor_ui/widgets/time_card.dart';

class PredictorTabletPortraitLayout extends StatelessWidget {
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

  //error messages
  final String? timeError;
  final String? itemsError;
  final String? pickersError;
  final String? rateError;

  //buttons
  final VoidCallback? onClear;
  final VoidCallback? onCalculate;

  const PredictorTabletPortraitLayout({
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
    this.timeError,
    this.itemsError,
    this.pickersError,
    this.rateError,
    required this.onClear,
    required this.onCalculate,
    required this.estimatedTime,
    required this.isCalculated,
    required this.isOver24Hrs,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppStyle.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColours.primaryBackground,
        body: Column(
          children: [
            _buildTopSection(style, context),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(child: _buildBottomSection(style)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Top Section
  Widget _buildTopSection(AppStyle style, BuildContext context) {
    return Container(
      width: double.infinity,
      height:
          MediaQuery.of(context).size.height * style.timeCardHeightMultiplier,
      decoration: _buildTimeCardDecoration(style),

      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildIconButtons(style),
            const Spacer(flex: 1),
            _buildTimeCardContent(style),
            const Spacer(flex: 3),
          ],
        ),
        
      ),
    );
  }

  Widget _buildIconButtons(AppStyle style) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: style.iconButtonHorizontalPadding,
        vertical: style.iconButtonVerticalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: MenuIconButton(
                tooltip: appStrings.tooltipMenu,
                onPressed: onMenu,
              ),
            ),
          ),

          HelpIconButton(tooltip: appStrings.tooltipHelp, onPressed: onHelp),

          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HistoryIconButton(
                    tooltip: appStrings.tooltipHistory,
                    onPressed: onHistory,
                  ),
                  SizedBox(width: style.iconButtonSpacing),
                  ModeIconButton(
                    tooltip: appStrings.tooltipSelectMode,
                    onPressed: onMode,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildTimeCardDecoration(AppStyle style) {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          AppColours.secondaryBackgroundLight,
          AppColours.secondaryBackgroundDark,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(style.timeCardBorderRadius),
        bottomRight: Radius.circular(style.timeCardBorderRadius),
      ),
    );
  }

  Widget _buildTimeCardContent(AppStyle style) {
    return TimeCard(
      estimatedTime: estimatedTime,
      isCalculated: isCalculated,
      isOver24Hrs: isOver24Hrs,
      appStrings: appStrings,
    );
  }

  //Bottom Section
  Widget _buildBottomSection(AppStyle style) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextFields(style),
        const Spacer(),
        _buildActionButtons(style),
      ],
    );
  }

  Widget _buildTextFields(AppStyle style) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: style.textFieldHorizontalMargin,
        vertical: style.textFieldVerticalMargin,
      ),

      child: Column(
        children: [
          AppTextField(
            controller: timeController,
            label: appStrings.promptCurrentTime,
            errorText: timeError,
            isCalculated: isCalculated,
          ),

          SizedBox(height: style.textFieldSpacing),

          AppTextField(
            controller: itemsController,
            label: appStrings.promptItemsRemaining,
            errorText: itemsError,
            isCalculated: isCalculated,
          ),

          SizedBox(height: style.textFieldSpacing),

          AppTextField(
            controller: pickersController,
            label: appStrings.promptNumberOfPickers,
            errorText: pickersError,
            isCalculated: isCalculated,
          ),

          SizedBox(height: style.textFieldSpacing),

          AppTextField(
            controller: rateController,
            label: appStrings.promptAveragePickRate,
            errorText: rateError,
            isCalculated: isCalculated,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(AppStyle style) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: style.actionButtonHorizontalMargin,
          vertical: style.actionButtonVerticalMargin,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClearButton(strings: appStrings, onPressed: onClear),
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
    );
  }
}
