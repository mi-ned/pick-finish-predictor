import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/i18n/strings_en.dart';
import 'package:pick_finish_predictor_ui/viewmodels/predictor_view_model.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_breakpoints.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_desktop_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_mobile_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_landscape_layout.dart';
import 'package:pick_finish_predictor_ui/views/layouts/predictor_tablet_portrait_layout.dart';
import 'package:pick_finish_predictor_ui/widgets/help_content_sheet.dart';

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

  void _showTopHelpSheet(BuildContext context, AppStrings appStrings){
    showGeneralDialog(
      context: context, 
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (dialogContext, animation, secondaryAnimation){
        final style = AppStyle.of(dialogContext);
        final mediaQuery = MediaQuery.of(dialogContext);
        final keyboardHeight = mediaQuery.viewInsets.bottom;
        final screenHeight = mediaQuery.size.height;

        final targetHeight = keyboardHeight > 0
          ? screenHeight - keyboardHeight - mediaQuery.padding.top
          : screenHeight * 0.85;

        return Align(
          alignment: Alignment.topCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOutCubic,
            height: targetHeight,
            width: double.infinity,
            child: Material(
              type: MaterialType.transparency,
              child: Dismissible(
                key: const Key ('top_help_sheet_key'),
                direction: DismissDirection.up,
                onDismissed: (_)  => Navigator.of(dialogContext).pop(),
              child: HelpContentSheet(strings: appStrings, style: style)
            )
          )
          )
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child){
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0,-1),
            end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation, 
                curve: Curves.easeOutCubic,
              ),
            ),
            child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = StringsEn();
    final mode = AppBreakpoints.getMode(context);

    //Callbacks top buttons
    void handleHelpTapped() => _showTopHelpSheet(context, strings);

    // Callbacks map directly to ViewModel methods
    final clearCallback = _viewModel.isClearButtonEnabled ? _viewModel.clear : null;
    final calculateCallback = _viewModel.isCalculateButtonEnabled ? _viewModel.calculate : null;

    switch (mode) {
      case DisplayMode.macOS:
        return PredictorDesktopLayout(
          appStrings: strings,
          onMenu: () => debugPrint('Menu tapped'),
          onHelp: () => handleHelpTapped(),
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
          appStrings: strings,
          onHelp: () => handleHelpTapped(),
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
          appStrings: strings,
          onHelp: () => handleHelpTapped(),
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
          appStrings: strings,
          onHelp: () => handleHelpTapped(),
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

