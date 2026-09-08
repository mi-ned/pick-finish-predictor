import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_en.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_desktop_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_mobile_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_landscape_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_portrait_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide system overlays for full-screen immersive UI
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );

  runApp(const PickFinishPredictorApp());
}

class PickFinishPredictorApp extends StatelessWidget {
  const PickFinishPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColours.primaryBackground,
      ),
      home: const PredictorTestPage(),
    );
  }
}

class PredictorTestPage extends StatefulWidget {
  const PredictorTestPage({super.key});

  @override
  State<PredictorTestPage> createState() => _PredictorTestPageState();
}

class _PredictorTestPageState extends State<PredictorTestPage> {
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
    _timeController.dispose();
    _itemsController.dispose();
    _pickersController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.primaryBackground,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // If the window gets squeezed below target dimensions, scale everything down uniformly
          return InteractiveViewer(
            panEnabled: false,
            scaleEnabled: false,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: SizedBox(
                // Force a stable target baseline (e.g., 1000x650)
                width: constraints.maxWidth < 1000 ? 1000 : constraints.maxWidth,
                height: constraints.maxHeight < 650 ? 650 : constraints.maxHeight,
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
            ),
          );
        },
      ),
    );
  }
}