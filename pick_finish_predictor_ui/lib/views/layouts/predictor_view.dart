import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_en.dart';
import 'package:pick_finish_predictor_ui/viewmodels/predictor_view_model.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_breakpoints.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_desktop_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_mobile_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_landscape_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_portrait_layout.dart';

class PredictorView extends StatefulWidget{
  const PredictorView({super.key});
  @override
  State<PredictorView> createState() => _PredictorViewState();
}

class _PredictorViewState extends State<PredictorView>{

  late final PredictorViewModel _viewModel;

  @override
  void initState(){
    super.initState();
    _viewModel = PredictorViewModel();
    _viewModel.addListener(_onViewModelUpdate);
  }

  void _onViewModelUpdate(){
    setState(() {});
  }

  @override
  void dispose(){
    _viewModel.removeListener(_onViewModelUpdate);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appStrings = StringsEn();
    final mode = AppBreakpoints.getMode(context);

    // Callbacks map directly to ViewModel methods
    final clearCallback = _viewModel.isClearButtonEnabled ? _viewModel.clear : null;
    final calculateCallback = _viewModel.isCalculateButtonEnabled ? _viewModel.calculate : null;

    switch (mode) {
      case DisplayMode.macOS:
        return PredictorDesktopLayout(
          appStrings: appStrings,
          onMenu: () => debugPrint('Menu tapped'),
          onHelp: () => debugPrint('Help tapped'),
          onHistory: () => debugPrint('History tapped'),
          onMode: () => debugPrint('Mode tapped'),
          timeController: _viewModel.timeController,
          itemsController: _viewModel.itemsController,
          pickersController: _viewModel.pickersController,
          rateController: _viewModel.rateController,
          timeError: _viewModel.timeError,
          itemsError: _viewModel.itemsError,
          pickersError: _viewModel.pickersError,
          rateError: _viewModel.rateError,
          onClear: clearCallback,
          onCalculate: calculateCallback,
          estimatedTime: _viewModel.estimatedTime,
          isCalculated: _viewModel.isCalculated,
          isOver24Hrs: _viewModel.isOver24Hrs,
        );

      case DisplayMode.iPadLandscape:
        return PredictorTabletLandscapeLayout(
          appStrings: appStrings,
          onMenu: () => debugPrint('Menu tapped'),
          onHelp: () => debugPrint('Help tapped'),
          onHistory: () => debugPrint('History tapped'),
          onMode: () => debugPrint('Mode tapped'),
          timeController: _viewModel.timeController,
          itemsController: _viewModel.itemsController,
          pickersController: _viewModel.pickersController,
          rateController: _viewModel.rateController,
          timeError: _viewModel.timeError,
          itemsError: _viewModel.itemsError,
          pickersError: _viewModel.pickersError,
          rateError: _viewModel.rateError,
          onClear: clearCallback,
          onCalculate: calculateCallback,
          estimatedTime: _viewModel.estimatedTime,
          isCalculated: _viewModel.isCalculated,
          isOver24Hrs: _viewModel.isOver24Hrs,
        );

      case DisplayMode.iPadPortrait:
        return PredictorTabletPortraitLayout(
          appStrings: appStrings,
          onMenu: () => debugPrint('Menu tapped'),
          onHelp: () => debugPrint('Help tapped'),
          onHistory: () => debugPrint('History tapped'),
          onMode: () => debugPrint('Mode tapped'),
          timeController: _viewModel.timeController,
          itemsController: _viewModel.itemsController,
          pickersController: _viewModel.pickersController,
          rateController: _viewModel.rateController,
          timeError: _viewModel.timeError,
          itemsError: _viewModel.itemsError,
          pickersError: _viewModel.pickersError,
          rateError: _viewModel.rateError,
          onClear: clearCallback,
          onCalculate: calculateCallback,
          estimatedTime: _viewModel.estimatedTime,
          isCalculated: _viewModel.isCalculated,
          isOver24Hrs: _viewModel.isOver24Hrs,
        );

      case DisplayMode.iPhone:
        return PredictorMobileLayout(
          appStrings: appStrings,
          onMenu: () => debugPrint('Menu tapped'),
          onHelp: () => debugPrint('Help tapped'),
          onHistory: () => debugPrint('History tapped'),
          onMode: () => debugPrint('Mode tapped'),
          timeController: _viewModel.timeController,
          itemsController: _viewModel.itemsController,
          pickersController: _viewModel.pickersController,
          rateController: _viewModel.rateController,
          timeError: _viewModel.timeError,
          itemsError: _viewModel.itemsError,
          pickersError: _viewModel.pickersError,
          rateError: _viewModel.rateError,
          onClear: clearCallback,
          onCalculate: calculateCallback,
          estimatedTime: _viewModel.estimatedTime,
          isCalculated: _viewModel.isCalculated,
          isOver24Hrs: _viewModel.isOver24Hrs,
        );
    }
  }

}

