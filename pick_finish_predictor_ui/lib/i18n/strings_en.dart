import 'app_strings.dart';

class StringsEn implements AppStrings{
  @override
  String get appName => 'PickPredict';
  @override
  String get accordianHeaderAveragePickRate => 'Average Pick Rate';
  @override
  String get accordianHeaderClearFields => 'Clear Fields';
  @override
  String get accordianHeaderClearHistory => 'Clear History';
  @override
  String get accordianHeaderCurrentTime => 'Current Time';
  @override
  String get accordianHeaderDynamicMode => 'Dynamic Mode';
  @override
  String get accordianHeaderFormulaBreakdown => 'Formula Breakdown';
  @override
  String get accordianHeaderHistory => 'History';
  @override
  String get accordianHeaderItemsRemaining => 'Items Remaining';
  @override
  String get accordianHeaderNotebook => 'Notebook';
  @override
  String get accordianHeaderNumberOfPickers => 'Number of Pickers';
  @override
  String get accordianHeaderStaticMode => 'Static Mode';
  @override
  String get calculateButton => 'CALCULATE';
  @override
  String get clearButton => 'CLEAR';
  @override
  String get deleteButton => 'Delete';
  @override
  String get editButton => 'Edit';
  @override
  String get errorMessageCapacityZero => 'Calculation Error: Total picking capacity is 0!';
  @override
  String get errorMessageIntegerRequired => 'Invalid Input: Must be a whole number!';
  @override
  String get errorMessageInvalidTime => 'Invalid Time: Could not recognise the time format!';
  @override
  String get errorMessagePositiveNumber => 'Invalid Input: Must be greater than 0!';
  @override
  String get headerEstimatedCompletionTime => 'Estimated Completion Time:';
  @override
  String get headerHelp => 'Help';
  @override
  String get historyAveragePickRate => 'Avg pick rate:';
  @override
  String get historyEstimatedCompletionTimeCalculated => 'Calculated Estimation:';
  @override
  String get historyItemsLeft => 'Items left:';
  @override
  String get historyLastMonth => 'Last Month';
  @override
  String get historyLastWeek => 'Last Week';
  @override
  String get historyNumberOfPickers => 'No. of pickers:';
  @override
  String get historyOlder => 'Older';
  @override
  String get historyThisMonth => 'This Month';
  @override
  String get historyThisWeek => 'This Week';
  @override
  String get historyTimeRecorded => 'Time recorded:';
  @override
  String get historyToday => 'Today';
  @override
  String get historyYesterday => 'Yesterday';
  @override
  String get modeDynamic => 'Dynamic';
  @override
  String get modeNotebook => 'Notebook';
  @override
  String get modeStatic => 'Static';
  @override
  String outputDaysCount(int count) => count == 1 ? '1 day' : '$count days';
  @override
  String get promptAveragePickRate => 'Average Pick Rate:';
  @override
  String get promptCurrentTime => 'Current Time:';
  @override
  String get promptItemsRemaining => 'Items Remaining:';
  @override
  String get promptNumberOfPickers => 'Number of Pickers:';
  @override
  String get textfieldSearch => 'Search';
  @override
  String get warningMessageExploitativeWorkload => '⚠️ Workload exceeds standard shift capacity!';

  @override
  String get tooltipHelp => 'Help';

  @override
  String get tooltipHistory => 'History';

  @override
  String get tooltipMenu => 'Main Menu';

  @override
  String get tooltipSelectMode => 'Select Mode';

  @override
  String get dynamicMode => 'Dynamic Mode';

  @override
  String get notebookMode => 'Notebook';

  @override
  String get staticMode => 'Static Mode';

  @override
  String get accordianContentAveragePickRate => 'The expected target units picked per person, per hour (e.g., 65 units/hr).';

  @override
  String get accordianContentClearFields => 'Resets all input fields and clears the current completion time estimate so you can start a fresh prediction.';

  @override
  String get accordianContentClearHistory => 'Permanently deletes all saved calculation records from local storage.';

  @override
    String get accordianContentCurrentTime => 'The start time for your prediction run (HH:mm). Enter your actual current shift time or the scheduled batch start time.';

  @override
  String get accordianContentDynamicMode => 'Recalculates completion estimates on the fly as live picking rates and headcount fluctuate during the shift.';

  @override
  String get accordianContentFormulaBreakdown => 'Total Hours = Items Remaining ÷ (Pickers × Pick Rate)\n\nEstimated Finish = Current Time + Total Hours required.';

  @override
  String get accordianContentHistory => 'Stores a log of your previous calculation runs so you can compare shift progression over time.';

  @override
  String get accordianContentItemsRemaining => 'The total unit or line count left to pick in the queue for the current wave or shift.';

  @override
  String get accordianContentNotebook => 'A dedicated workspace to log shift notes, track picker break schedules, and flag operational delays.';

  @override
  String get accordianContentNumberOfPickers => 'The total number of active staff currently assigned to picking tasks on the floor.';

  @override
  String get accordianContentStaticMode => 'Provides a point-in-time calculation assuming a constant pick rate and fixed headcount throughout the run.';

  @override
  String get noTextFound => 'No matching topics found';
  }