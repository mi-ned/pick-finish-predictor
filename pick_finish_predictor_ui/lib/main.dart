import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_en.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_breakpoints.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_desktop_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_mobile_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_landscape_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_portrait_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pick Finish Predictor',
      debugShowCheckedModeBanner: false,
      home: PredictorScreen(),
    );
  }
}

class PredictorScreen extends StatefulWidget {
  const PredictorScreen({super.key});

  @override
  State<PredictorScreen> createState() => _PredictorScreenState();
}

class _PredictorScreenState extends State<PredictorScreen> {
  // Shared Form Controllers
  final timeController = TextEditingController(text: '08:00');
  final itemsController = TextEditingController(text: '1250');
  final pickersController = TextEditingController(text: '5');
  final rateController = TextEditingController(text: '45');

  // Shared Calculation State
  String estimatedTime = '13:33';
  bool isCalculated = true;
  bool isOver24Hrs = false;

  @override
  void dispose() {
    timeController.dispose();
    itemsController.dispose();
    pickersController.dispose();
    rateController.dispose();
    super.dispose();
  }

  void _onCalculate() {
    setState(() {
      isCalculated = true;
      estimatedTime = '14:15';
    });
  }

  void _onClear() {
    setState(() {
      timeController.clear();
      itemsController.clear();
      pickersController.clear();
      rateController.clear();
      isCalculated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appStrings = StringsEn();

    return LayoutBuilder(
      builder: (context, constraints) {
        // Query the active mode from your AppBreakpoints helper
        final mode = AppBreakpoints.getMode(context);

        switch (mode) {
          case DisplayMode.macOS:

          return PredictorDesktopLayout(
              appStrings: appStrings,
              onMenu: () => debugPrint('Menu tapped'),
              onHelp: () => debugPrint('Help tapped'),
              onHistory: () => debugPrint('History tapped'),
              onMode: () => debugPrint('Mode tapped'),
              timeController: timeController,
              itemsController: itemsController,
              pickersController: pickersController,
              rateController: rateController,
              onClear: _onClear,
              onCalculate: _onCalculate,
              estimatedTime: estimatedTime,
              isCalculated: isCalculated,
              isOver24Hrs: isOver24Hrs,
            );

          case DisplayMode.iPadLandscape:
            return PredictorTabletLandscapeLayout(
              appStrings: appStrings,
              onMenu: () => debugPrint('Menu tapped'),
              onHelp: () => debugPrint('Help tapped'),
              onHistory: () => debugPrint('History tapped'),
              onMode: () => debugPrint('Mode tapped'),
              timeController: timeController,
              itemsController: itemsController,
              pickersController: pickersController,
              rateController: rateController,
              onClear: _onClear,
              onCalculate: _onCalculate,
              estimatedTime: estimatedTime,
              isCalculated: isCalculated,
              isOver24Hrs: isOver24Hrs,
            );

          case DisplayMode.iPadPortrait:
            return PredictorTabletPortraitLayout(
              appStrings: appStrings,
              onMenu: () => debugPrint('Menu tapped'),
              onHelp: () => debugPrint('Help tapped'),
              onHistory: () => debugPrint('History tapped'),
              onMode: () => debugPrint('Mode tapped'),
              timeController: timeController,
              itemsController: itemsController,
              pickersController: pickersController,
              rateController: rateController,
              onClear: _onClear,
              onCalculate: _onCalculate,
              estimatedTime: estimatedTime,
              isCalculated: isCalculated,
              isOver24Hrs: isOver24Hrs,
            );

          case DisplayMode.iPhone:
          return PredictorMobileLayout(
              appStrings: appStrings,
              onMenu: () => debugPrint('Menu tapped'),
              onHelp: () => debugPrint('Help tapped'),
              onHistory: () => debugPrint('History tapped'),
              onMode: () => debugPrint('Mode tapped'),
              timeController: timeController,
              itemsController: itemsController,
              pickersController: pickersController,
              rateController: rateController,
              onClear: _onClear,
              onCalculate: _onCalculate,
              estimatedTime: estimatedTime,
              isCalculated: isCalculated,
              isOver24Hrs: isOver24Hrs,
            );
        }
      },
    );
  }
}