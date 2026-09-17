import 'package:pick_finish_predictor_ui/models/completion_result_model.dart';
import 'package:pick_finish_predictor_ui/models/metrics_model.dart';
import 'package:pick_finish_predictor_ui/models/time_parser_model.dart';

class CalculationModel{
    static CompletionResultModel predictFinishTime(MetricsModel metrics){
        return calculateCompletionTime(DateTime.now(), metrics);
    }

    static CompletionResultModel calculateCompletionTime(DateTime startTime, MetricsModel metrics){

      final double hoursRequired = metrics.estimatedTimeRequired();
      final int totalMinutes = (hoursRequired * 60).round();
      final int daysAdded = totalMinutes ~/ (24 * 60);
      final DateTime finishTime = startTime.add(Duration(minutes: totalMinutes));
      final String formattedFinishTime = '${finishTime.hour.toString().padLeft(2, '0')}:${finishTime.minute.toString().padLeft(2, '0')}';

      final bool isMultiDay = (startTime.hour * 60 + startTime.minute + totalMinutes >= 1440);

      return CompletionResultModel(
        finishTime: formattedFinishTime,
        daysAdded: daysAdded,
        totalHours: hoursRequired,
        multiDay: daysAdded > 0 || isMultiDay,
      );

    }

    static CompletionResultModel? process({
      required String rawTime, required MetricsModel metrics,
    }) {
      final DateTime? startTime = TimeParserModel.parseTime(rawTime);
      if(startTime == null) return null;
      return calculateCompletionTime(startTime, metrics);
    }
}