// main.dart (Pure UI Design Mode)
import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_en.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_mobile_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_portrait_layout.dart';

void main() {
  runApp(const PickFinishPredictorApp());
}

class PickFinishPredictorApp extends StatelessWidget {
  const PickFinishPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PredictorMobileLayout( //or PredictorTabletPortraitLayout | PredictorMobileLayout
        appStrings: StringsEn(),
        onMenu: () {},
        onHelp: () {},
        onHistory: () {},
        onMode: () {},
        estimatedTime: '00:00',
        isCalculated: false,
        isOver24Hrs: true, // Test warning badge visually
        timeController: TextEditingController(text: ''),
        itemsController: TextEditingController(text: '67'),
        pickersController: TextEditingController(text: ''),
        rateController: TextEditingController(text: ''),
        onClear: () {},
        onCalculate: () {},
      ),
    );
  }
}