// Location: lib/main.dart
import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_en.dart'; // Concrete implementation
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/widgets/app_action_buttons.dart';
import 'package:pick_finish_predictor_ui/widgets/app_icon_buttons.dart';
import 'package:pick_finish_predictor_ui/widgets/app_input_field.dart';
import 'package:pick_finish_predictor_ui/widgets/completion_time_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColours.primaryBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _timeController = TextEditingController(text: '08:00');
  final _itemsController = TextEditingController(text: '1200');
  final _pickersController = TextEditingController(text: '4');
  final _rateController = TextEditingController(text: '75');

  // Concrete instance implementing AppStrings
  final _appStrings = StringsEn();

  bool _isCalculated = false;
  bool _isOver24Hrs = false;

  @override
  void dispose() {
    _timeController.dispose();
    _itemsController.dispose();
    _pickersController.dispose();
    _rateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuIconButton(onPressed: () {}),
        actions: [
          ModeIconButton(onPressed: () {}),
          HistoryIconButton(onPressed: () {}),
          HelpIconButton(onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculates exactly 1/3 of the body height for the header card
            final cardHeight = constraints.maxHeight * (1 / 3);

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 1. Flush Header Card (1/3 Screen Height)
                      SizedBox(
                        height: cardHeight,
                        child: CompletionTimeCard(
                          estimatedTime: _isCalculated
                              ? (_isOver24Hrs ? '28:15' : '12:00')
                              : '--:--',
                          isCalculated: _isCalculated,
                          isOver24Hrs: _isOver24Hrs,
                          appStrings: _appStrings,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // 2. Input Fields & Buttons (2/3 Screen Height with 20pt Padding)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AppInputField(
                                label: 'Current Time:',
                                controller: _timeController,
                                isCalculated: _isCalculated,
                                keyboardType: TextInputType.datetime,
                              ),

                              const SizedBox(height: 30),

                              AppInputField(
                                label: 'Items Remaining:',
                                controller: _itemsController,
                                isCalculated: _isCalculated,
                                keyboardType: TextInputType.number,
                              ),

                              const SizedBox(height: 30),

                              AppInputField(
                                label: 'Number of Pickers:',
                                controller: _pickersController,
                                isCalculated: _isCalculated,
                                keyboardType: TextInputType.number,
                              ),

                              const SizedBox(height: 30),

                              AppInputField(
                                label: 'Average Pick Rate:',
                                controller: _rateController,
                                isCalculated: _isCalculated,
                                keyboardType: TextInputType.number,
                              ),

                              const Spacer(),

                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ClearButton(
                                      strings: _appStrings,
                                      isEnabled: true,
                                      onPressed: () {
                                        setState(() {
                                          _timeController.clear();
                                          _itemsController.clear();
                                          _pickersController.clear();
                                          _rateController.clear();
                                          _isCalculated = false;
                                          _isOver24Hrs = false;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 3,
                                    child: CalculateButton(
                                      strings: _appStrings,
                                      isEnabled: true,
                                      onPressed: () {
                                        setState(() {
                                          if (!_isCalculated) {
                                            _isCalculated = true;
                                            _isOver24Hrs = false;
                                          } else if (!_isOver24Hrs) {
                                            _isOver24Hrs = true;
                                          } else {
                                            _isCalculated = false;
                                            _isOver24Hrs = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}