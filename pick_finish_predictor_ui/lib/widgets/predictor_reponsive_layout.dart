// lib/widgets/predictor_responsive_layout.dart
import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_mobile_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_portrait_layout.dart';

class PredictorResponsiveLayout extends StatelessWidget {
  final AppStrings appStrings;

  // Header / Menu Callbacks
  final VoidCallback onMenu;
  final VoidCallback onHelp;
  final VoidCallback onHistory;
  final VoidCallback onMode;

  // Output Card State
  final String estimatedTime;
  final bool isCalculated;
  final bool isOver24Hrs;

  // Form Field Controllers
  final TextEditingController timeController;
  final TextEditingController itemsController;
  final TextEditingController pickersController;
  final TextEditingController rateController;

  // Action Bar Callbacks
  final VoidCallback onClear;
  final VoidCallback onCalculate;

  const PredictorResponsiveLayout({
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
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;

        // 1. Desktop & iPad Landscape Split View (Width >= 900 or Landscape)
        if (constraints.maxWidth >= 900 || isLandscape) {
          // You will swap this with PredictorTwoColumnLayout on Mon/Tue
          return PredictorTabletPortraitLayout(
            appStrings: appStrings,
            onMenu: onMenu,
            onHelp: onHelp,
            onHistory: onHistory,
            onMode: onMode,
            estimatedTime: estimatedTime,
            isCalculated: isCalculated,
            isOver24Hrs: isOver24Hrs,
            timeController: timeController,
            itemsController: itemsController,
            pickersController: pickersController,
            rateController: rateController,
            onClear: onClear,
            onCalculate: onCalculate,
          );
        }

        // 2. iPad Portrait (Width >= 600)
        if (constraints.maxWidth >= 600) {
          return PredictorTabletPortraitLayout(
            appStrings: appStrings,
            onMenu: onMenu,
            onHelp: onHelp,
            onHistory: onHistory,
            onMode: onMode,
            estimatedTime: estimatedTime,
            isCalculated: isCalculated,
            isOver24Hrs: isOver24Hrs,
            timeController: timeController,
            itemsController: itemsController,
            pickersController: pickersController,
            rateController: rateController,
            onClear: onClear,
            onCalculate: onCalculate,
          );
        }

        // 3. iPhone / Mobile Compact View (Width < 600)
        return PredictorMobileLayout(
          appStrings: appStrings,
          onMenu: onMenu,
          onHelp: onHelp,
          onHistory: onHistory,
          onMode: onMode,
          estimatedTime: estimatedTime,
          isCalculated: isCalculated,
          isOver24Hrs: isOver24Hrs,
          timeController: timeController,
          itemsController: itemsController,
          pickersController: pickersController,
          rateController: rateController,
          onClear: onClear,
          onCalculate: onCalculate,
        );
      },
    );
  }
}