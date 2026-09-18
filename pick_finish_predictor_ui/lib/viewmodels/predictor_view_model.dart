import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/models/calculation_model.dart';
import 'package:pick_finish_predictor_ui/models/metrics_model.dart';
import 'package:pick_finish_predictor_ui/models/time_parser_model.dart';

class PredictorViewModel extends ChangeNotifier {

  final timeController = TextEditingController();
  final itemsController = TextEditingController();
  final pickersController = TextEditingController();
  final rateController = TextEditingController();

  String? timeError;
  String? itemsError;
  String? pickersError;
  String? rateError;

  String estimatedTime = "--:--";
  bool isCalculated = false;
  bool isOver24Hrs = false;
  bool isPostCalculation = false;

  PredictorViewModel(){
    timeController.addListener(_onFieldInputChanged);
    itemsController.addListener(_onFieldInputChanged);
    pickersController.addListener(_onFieldInputChanged);
    rateController.addListener(_onFieldInputChanged);
  }

  void _onFieldInputChanged(){
      timeError = null;
      itemsError = null;
      pickersError = null;
      rateError = null;
      notifyListeners();
  }

  bool get isClearButtonEnabled =>
      timeController.text.trim().isNotEmpty ||
      itemsController.text.trim().isNotEmpty ||
      pickersController.text.trim().isNotEmpty ||
      rateController.text.trim().isNotEmpty;

  bool get isCalculateButtonEnabled =>
  !isPostCalculation &&
    timeController.text.trim().isNotEmpty &&
      itemsController.text.trim().isNotEmpty &&
      pickersController.text.trim().isNotEmpty &&
      rateController.text.trim().isNotEmpty;

  void calculate(){
    final rawTime = timeController.text.trim();
    final items = int.tryParse(itemsController.text.replaceAll(',','').replaceAll(' ', '').trim());
    final pickers = int.tryParse(pickersController.text.replaceAll(',','').replaceAll(' ', '').trim());
    final rate = int.tryParse(rateController.text.replaceAll(',','').replaceAll(' ', '').trim());

    final DateTime? parsedTime = TimeParserModel.parseTime(rawTime);
    timeError = (parsedTime == null) ? 'Invalid time format' : null;

    itemsError = (items == null || items <= 0) ? 'Enter valid items (>0)' : null;
    pickersError = (pickers == null || pickers <= 0) ? 'Enter valid pickers (>0)' : null;
    rateError = (rate == null || rate <= 0) ? 'Enter valid pick rate (>0)' : null;

    if(timeError == null && itemsError == null && pickersError == null && rateError == null){
        final metrics = MetricsModel(
          itemsRemaining: items!,
          averagePickrate: rate!,
          currentNumberOfPickers: pickers!,
        );

        final result = CalculationModel.calculateCompletionTime(parsedTime!, metrics);

        estimatedTime = result.finishTime;
        isOver24Hrs = result.multiDay;
        isCalculated = true;

        postCalculation();
    } else {
      isCalculated = false;
    }

    notifyListeners();

  }

  void clear(){
    timeController.clear();
    itemsController.clear();
    pickersController.clear();
    rateController.clear();

    timeError = null;
    itemsError = null;
    pickersError = null;
    rateError = null;

    isCalculated = false;
    estimatedTime = '--:--';
    isOver24Hrs = false;

    isPostCalculation = false;

    notifyListeners();
  }

  void postCalculation(){
    isPostCalculation = true;
    notifyListeners();
  }

  @override
  void dispose(){
    timeController.dispose();
    itemsController.dispose();
    pickersController.dispose();
    rateController.dispose();
    super.dispose();
  }
}