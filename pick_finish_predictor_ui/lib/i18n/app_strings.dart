abstract class AppStrings{
  //Main buttons
  String get calculateButton;
  String get clearButton;
  //Prompts
  String get promptCurrentTime;
  String get promptItemsRemaining;
  String get promptNumberOfPickers;
  String get promptAveragePickRate;
  //Header/Outputs
  String get headerEstimatedCompletionTime;
  String outputDaysCount(int count);
  //Error
  String get errorMessageCapacityZero;
  String get errorMessageInvalidTime;
  String get errorMessagePositiveNumber;
  String get errorMessageIntegerRequired;
  //Warning
  String get warningMessageExploitativeWorkload;
  //Modes
  String get modeStatic;
  String get modeDynamic;
  String get modeNotebook;
  //Timeline
  String get historyToday;
  String get historyYesterday;
  String get historyThisWeek;
  String get historyLastWeek;
  String get historyThisMonth;
  String get historyLastMonth;
  String get historyOlder;
  //History tab contents
  String get historyTimeRecorded;
  String get historyItemsLeft;
  String get historyNumberOfPickers;
  String get historyAveragePickRate;
  String get historyEstimatedCompletionTimeCalculated;
  //History buttons
  String get editButton;
  String get deleteButton;
  //Help
  String get headerHelp;
  //Help accordians
  String get accordianCurrentTime;
  String get accordianItemsRemaining;
  String get accordianNumberOfPickers;
  String get accordianAveragePickRate;
  String get accordianFormulaBreakdown;
  String get accordianClearFields;
  String get accordianStaticMode;
  String get accordianDynamicMode;
  String get accordianNotebook;
  String get accordianHistory;
  String get accordianClearHistory;
  //Help contents
            //String get contentsCurrentTime; etc...
  //Help textfield
  String get textfieldSearch;
}