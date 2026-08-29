import 'app_strings.dart';

class StringsEn implements AppStrings{
  @override
  String get accordianAveragePickRate => 'Average Pick Rate';
  @override
  String get accordianClearFields => 'Clear Fields';
  @override
  String get accordianClearHistory => 'Clear History';
  @override
  String get accordianCurrentTime => 'Current Time';
  @override
  String get accordianDynamicMode => 'Dynamic Mode';
  @override
  String get accordianFormulaBreakdown => 'Formula Breakdown';
  @override
  String get accordianHistory => 'History';
  @override
  String get accordianItemsRemaining => 'Items Remaining';
  @override
  String get accordianNotebook => 'Notebook';
  @override
  String get accordianNumberOfPickers => 'Number of Pickers';
  @override
  String get accordianStaticMode => 'Static Mode';
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
  String get errorMessagePositiveNumber => 'Invalid Input: Musst be greater than 0!';
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
  // TODO: implement tooltipHelp
  String get tooltipHelp => 'Help';

  @override
  // TODO: implement tooltipHistory
  String get tooltipHistory => 'History';

  @override
  // TODO: implement tooltipMenu
  String get tooltipMenu => 'Main Menu';

  @override
  // TODO: implement tooltipSelectMode
  String get tooltipSelectMode => 'Select Mode';
  }