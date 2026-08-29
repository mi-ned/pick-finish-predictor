import 'app_strings.dart';

class StringsDe implements AppStrings {
  @override
  String get accordianAveragePickRate => 'Durchschnittliche Pick-Rate';
  @override
  String get accordianClearFields => 'Felder zurücksetzen';
  @override
  String get accordianClearHistory => 'Verlauf löschen';
  @override
  String get accordianCurrentTime => 'Aktuelle Uhrzeit';
  @override
  String get accordianDynamicMode => 'Dynamischer Modus';
  @override
  String get accordianFormulaBreakdown => 'Formel-Aufschlüsselung';
  @override
  String get accordianHistory => 'Verlauf';
  @override
  String get accordianItemsRemaining => 'Verbleibende Artikel';
  @override
  String get accordianNotebook => 'Notizblock';
  @override
  String get accordianNumberOfPickers => 'Anzahl der Kommissionierer';
  @override
  String get accordianStaticMode => 'Statischer Modus';
  @override
  String get calculateButton => 'BERECHNEN';
  @override
  String get clearButton => 'RESET';
  @override
  String get deleteButton => 'Löschen';
  @override
  String get editButton => 'Bearbeiten';
  @override
  String get errorMessageCapacityZero => 'Berechnungsfehler: Gesamte Pick-Kapazität ist 0!';
  @override
  String get errorMessageIntegerRequired => 'Ungültige Eingabe: Bitte eine ganze Zahl eingeben.';
  @override
  String get errorMessageInvalidTime => 'Ungültige Zeit: Zeitformat konnte nicht erkannt werden.';
  @override
  String get errorMessagePositiveNumber => 'Ungültige Eingabe: Muss größer als 0 sein.';
  @override
  String get headerEstimatedCompletionTime => 'Voraussichtliche Fertigstellung:';
  @override
  String get headerHelp => 'Hilfe';
  @override
  String get historyAveragePickRate => 'Durchschn. Rate:';
  @override
  String get historyEstimatedCompletionTimeCalculated => 'Berechnete Endzeit:';
  @override
  String get historyItemsLeft => 'Verbleibende Artikel:';
  @override
  String get historyLastMonth => 'Letzten Monat';
  @override
  String get historyLastWeek => 'Letzte Woche';
  @override
  String get historyNumberOfPickers => 'Anzahl Kommissionierer:';
  @override
  String get historyOlder => 'Älter';
  @override
  String get historyThisMonth => 'Diesen Monat';
  @override
  String get historyThisWeek => 'Diese Woche';
  @override
  String get historyTimeRecorded => 'Aufgezeichnete Zeit:';
  @override
  String get historyToday => 'Heute';
  @override
  String get historyYesterday => 'Gestern';
  @override
  String get modeDynamic => 'Dynamisch';
  @override
  String get modeNotebook => 'Notizblock';
  @override
  String get modeStatic => 'Statisch';
  @override
  String outputDaysCount(int count) => count == 1 ? '1 Tag' : '$count Tage';
  @override
  String get promptAveragePickRate => 'Durchschnittliche Pick-Rate:';
  @override
  String get promptCurrentTime => 'Aktuelle Uhrzeit:';
  @override
  String get promptItemsRemaining => 'Verbleibende Artikel:';
  @override
  String get promptNumberOfPickers => 'Anzahl der Kommissionierer:';
  @override
  String get textfieldSearch => 'Suchen...';
  @override
  String get warningMessageExploitativeWorkload => '⚠️ Die Arbeitslast überschreitet die Standard-Schichtkapazität.';

  @override
  // TODO: implement tooltipHelp
  String get tooltipHelp => 'Hilfe';

  @override
  // TODO: implement tooltipHistory
  String get tooltipHistory => 'Verlauf';

  @override
  // TODO: implement tooltipMenu
  String get tooltipMenu => 'Hauptmenü';

  @override
  // TODO: implement tooltipSelectMode
  String get tooltipSelectMode => 'Modus auswählen';
}