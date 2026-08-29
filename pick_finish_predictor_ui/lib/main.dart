import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_en.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_mobile_layout.dart';

void main() {
  runApp(const TempPredictorApp());
}

class TempPredictorApp extends StatelessWidget {
  const TempPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pick Finish Predictor',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColours.primaryBackground,
      ),
      home: const TempPredictorScreen(),
    );
  }
}

class TempPredictorScreen extends StatefulWidget {
  const TempPredictorScreen({super.key});

  @override
  State<TempPredictorScreen> createState() => _TempPredictorScreenState();
}

class _TempPredictorScreenState extends State<TempPredictorScreen> {
  // Localization setup
  late final AppStrings appStrings;

  // Controllers initialized as empty
  final TextEditingController timeController = TextEditingController();
  final TextEditingController itemsController = TextEditingController();
  final TextEditingController pickersController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    appStrings = StringsEn();
  }

  @override
  void dispose() {
    timeController.dispose();
    itemsController.dispose();
    pickersController.dispose();
    rateController.dispose();
    super.dispose();
  }

  // Dummy no-op callback for disabled interactions
  void _disabledCallback() {}

  @override
  Widget build(BuildContext context) {
    return PredictorMobileLayout(
      appStrings: appStrings,

      // Icon Callbacks
      onMenu: _disabledCallback,
      onHelp: _disabledCallback,
      onHistory: _disabledCallback,
      onMode: _disabledCallback,

      // State configured for warning & zeroed time
      estimatedTime: '00:00',
      isCalculated: false,
      isOver24Hrs: true, // Shows the warning message state

      // Empty Text Controllers
      timeController: timeController,
      itemsController: itemsController,
      pickersController: pickersController,
      rateController: rateController,

      // Action Callbacks
      onClear: _disabledCallback,
      onCalculate: _disabledCallback,
    );
  }
}