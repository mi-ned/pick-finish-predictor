// Location: lib/main.dart
import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_es.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_zh.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_de.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_hi.dart';

import 'i18n/strings_en.dart';
import 'widgets/app_action_buttons.dart'; // Adjust path if your button file is named differently

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // English string instance (swap to StringsDe(), StringsEs(), etc. to test i18n)
    final strings = StringsDe();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF252525),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Preview Screen'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Form input fields will be added here
                const Spacer(),

                // DUAL ACTION BUTTON BAR
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClearButton(
                        strings: strings,
                        isEnabled: true,
                        onPressed: () {
                          debugPrint('Clear action triggered!');
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    
                    Expanded(
                      flex: 3,
                      child: CalculateButton(
                        strings: strings,
                        isEnabled: true,
                        onPressed: () {
                          debugPrint('Calculate action triggered!');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}