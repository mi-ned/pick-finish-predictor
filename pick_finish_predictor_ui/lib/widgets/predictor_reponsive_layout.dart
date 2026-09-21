// lib/widgets/predictor_responsive_layout.dart
import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_breakpoints.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_desktop_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_mobile_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_landscape_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_portrait_layout.dart';

class PredictorResponsiveLayout extends StatelessWidget {
  final AppStrings appStrings;

  // Header / Menu Callbacks
  final VoidCallback onMenu;
  final VoidCallback onHelp;
  final VoidCallback onHistory;
  final VoidCallback onMode;

  //Help
  final bool isHelpVisible;
  final VoidCallback? onCloseHelp;

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
  final VoidCallback? onClear;
  final VoidCallback? onCalculate;

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
    this.isHelpVisible = false,
    this.onCloseHelp,
  });

  @override
  Widget build(BuildContext context) {

    final mode = AppBreakpoints.getMode(context);

    switch(mode){
      case DisplayMode.iPhone:
        return PredictorMobileLayout(appStrings: appStrings, onHelp: onHelp, onHistory: onHistory, onMode: onMode, estimatedTime: estimatedTime, isCalculated: isCalculated, isOver24Hrs: isOver24Hrs, timeController: timeController, itemsController: itemsController, pickersController: pickersController, rateController: rateController, onClear: onClear, onCalculate: onCalculate);
      case DisplayMode.iPadPortrait:
        return PredictorTabletPortraitLayout(appStrings: appStrings, onHelp: onHelp, onHistory: onHistory, onMode: onMode, estimatedTime: estimatedTime, isCalculated: isCalculated, isOver24Hrs: isOver24Hrs, timeController: timeController, itemsController: itemsController, pickersController: pickersController, rateController: rateController, onClear: onClear, onCalculate: onCalculate);
      case DisplayMode.iPadLandscape:
        return PredictorTabletLandscapeLayout(appStrings: appStrings, onHelp: onHelp, onHistory: onHistory, onMode: onMode, timeController: timeController, itemsController: itemsController, pickersController: pickersController, rateController: rateController, onClear: onClear, onCalculate: onCalculate, estimatedTime: estimatedTime, isCalculated: isCalculated, isOver24Hrs: isOver24Hrs, isHelpVisible: isHelpVisible, onCloseHelp: onCloseHelp ?? () {},);
      case DisplayMode.macOS:
        return PredictorDesktopLayout(appStrings: appStrings, onMenu: onMenu, onHelp: onHelp, onHistory: onHistory, onMode: onMode, timeController: timeController, itemsController: itemsController, pickersController: pickersController, rateController: rateController, onClear: onClear, onCalculate: onCalculate, estimatedTime: estimatedTime, isCalculated: isCalculated, isOver24Hrs: isOver24Hrs);
    }
    
  }
}