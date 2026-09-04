import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_en.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_desktop_layout.dart';

void main() {

  /*
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(900, 600), // Prevents layout crushing
    size: Size(1200, 800),
  );
  
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  */

  runApp(const PickFinishPredictorApp());
}

class PickFinishPredictorApp extends StatelessWidget {
  const PickFinishPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PredictorTestPage(),
    );
  }
}

class PredictorTestPage extends StatefulWidget {
  const PredictorTestPage({super.key});

  @override
  State<PredictorTestPage> createState() => _PredictorTestPageState();
}

class _PredictorTestPageState extends State<PredictorTestPage> {
  // Instantiated ONCE in state
  late final TextEditingController _timeController;
  late final TextEditingController _itemsController;
  late final TextEditingController _pickersController;
  late final TextEditingController _rateController;

  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController(text: '');
    _itemsController = TextEditingController(text: '67');
    _pickersController = TextEditingController(text: '');
    _rateController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    // Clean up memory
    _timeController.dispose();
    _itemsController.dispose();
    _pickersController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      // Ensure 'child:' parameter name is explicitly defined here
        child: PredictorDesktopLayout(
          appStrings: StringsEn(),
          onMenu: () {},
          onHelp: () {},
          onHistory: () {},
          onMode: () {},
          estimatedTime: '00:00',
          isCalculated: false,
          isOver24Hrs: true,
          timeController: _timeController,
          itemsController: _itemsController,
          pickersController: _pickersController,
          rateController: _rateController,
          onClear: () {},
          onCalculate: () {},
        ),
      ),
  );
}
}