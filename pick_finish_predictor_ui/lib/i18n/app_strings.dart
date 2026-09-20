abstract class AppStrings{

  //Top Left
  String get appName;
  String get staticMode;
  String get dynamicMode;
  String get notebookMode;

  //Tooltip
  String get tooltipMenu;
  String get tooltipHelp;
  String get tooltipHistory;
  String get tooltipSelectMode;
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
  //Help accordian headers
  String get accordianHeaderCurrentTime;
  String get accordianHeaderItemsRemaining;
  String get accordianHeaderNumberOfPickers;
  String get accordianHeaderAveragePickRate;
  String get accordianHeaderFormulaBreakdown;
  String get accordianHeaderClearFields;
  String get accordianHeaderStaticMode;
  String get accordianHeaderDynamicMode;
  String get accordianHeaderNotebook;
  String get accordianHeaderHistory;
  String get accordianHeaderClearHistory;
  //Help contents
  String get accordianContentCurrentTime;
  String get accordianContentItemsRemaining;
  String get accordianContentNumberOfPickers;
  String get accordianContentAveragePickRate;
  String get accordianContentFormulaBreakdown;
  String get accordianContentClearFields;
  String get accordianContentStaticMode;
  String get accordianContentDynamicMode;
  String get accordianContentNotebook;
  String get accordianContentHistory;
  String get accordianContentClearHistory;
  //Help textfield
  String get textfieldSearch;
  String get noTextFound;
}