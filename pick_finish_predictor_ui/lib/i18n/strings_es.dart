import 'app_strings.dart';

class StringsEs implements AppStrings {
  @override
  String get accordianAveragePickRate => 'Tasa media de recolección';
  @override
  String get accordianClearFields => 'Limpiar campos';
  @override
  String get accordianClearHistory => 'Borrar historial';
  @override
  String get accordianCurrentTime => 'Hora actual';
  @override
  String get accordianDynamicMode => 'Modo Dinámico';
  @override
  String get accordianFormulaBreakdown => 'Desglose de la fórmula';
  @override
  String get accordianHistory => 'Historial';
  @override
  String get accordianItemsRemaining => 'Artículos restantes';
  @override
  String get accordianNotebook => 'Bloc de notas';
  @override
  String get accordianNumberOfPickers => 'Número de recolectores';
  @override
  String get accordianStaticMode => 'Modo Estático';
  @override
  String get calculateButton => 'CALCULAR';
  @override
  String get clearButton => 'LIMPIAR';
  @override
  String get deleteButton => 'Eliminar';
  @override
  String get editButton => 'Editar';
  @override
  String get errorMessageCapacityZero => 'Error de cálculo: ¡La capacidad total de recolección es 0!';
  @override
  String get errorMessageIntegerRequired => 'Entrada no válida: Ingrese un número entero.';
  @override
  String get errorMessageInvalidTime => 'Hora no válida: Formato de hora no reconocido.';
  @override
  String get errorMessagePositiveNumber => 'Entrada no válida: Debe ser mayor que 0.';
  @override
  String get headerEstimatedCompletionTime => 'Hora estimada de finalización:';
  @override
  String get headerHelp => 'Ayuda';
  @override
  String get historyAveragePickRate => 'Tasa media:';
  @override
  String get historyEstimatedCompletionTimeCalculated => 'Previsión calculada:';
  @override
  String get historyItemsLeft => 'Artículos restantes:';
  @override
  String get historyLastMonth => 'El mes pasado';
  @override
  String get historyLastWeek => 'La semana pasada';
  @override
  String get historyNumberOfPickers => 'N.º de recolectores:';
  @override
  String get historyOlder => 'Más antiguo';
  @override
  String get historyThisMonth => 'Este mes';
  @override
  String get historyThisWeek => 'Esta semana';
  @override
  String get historyTimeRecorded => 'Hora registrada:';
  @override
  String get historyToday => 'Hoy';
  @override
  String get historyYesterday => 'Ayer';
  @override
  String get modeDynamic => 'Dinámico';
  @override
  String get modeNotebook => 'Bloc de notas';
  @override
  String get modeStatic => 'Estático';
  @override
  String outputDaysCount(int count) => count == 1 ? '1 día' : '$count días';
  @override
  String get promptAveragePickRate => 'Tasa media de recolección:';
  @override
  String get promptCurrentTime => 'Hora actual:';
  @override
  String get promptItemsRemaining => 'Artículos restantes:';
  @override
  String get promptNumberOfPickers => 'Número de recolectores:';
  @override
  String get textfieldSearch => 'Buscar...';
  @override
  String get warningMessageExploitativeWorkload => '⚠️ La carga de trabajo supera la capacidad estándar del turno.';

  @override
  // TODO: implement tooltipHelp
  String get tooltipHelp => 'Ayuda';

  @override
  // TODO: implement tooltipHistory
  String get tooltipHistory => 'Historial';

  @override
  // TODO: implement tooltipMenu
  String get tooltipMenu => 'Menú principal';

  @override
  // TODO: implement tooltipSelectMode
  String get tooltipSelectMode => 'Seleccionar modo';
}