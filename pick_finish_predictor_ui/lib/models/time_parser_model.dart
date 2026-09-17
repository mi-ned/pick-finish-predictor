
class TimeParserModel {
  static DateTime? parseTime(String rawInput) {
    if (rawInput.trim().isEmpty) return null;

    // 1. Sanitize text input matching Java logic
    String cleanInput = rawInput
        .trim()
        .replaceAll(RegExp(r'(?<=[ap])\.(?=m)', caseSensitive: false), '')
        .replaceAll(RegExp(r'(?<=[ap]m)\.', caseSensitive: false), '')
        .replaceAll(RegExp(r'(?<=\d)\s*(?=[ap]m\b)', caseSensitive: false), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .toLowerCase();

    // 2. Extract AM/PM indicator
    final isPm = cleanInput.contains('pm');
    final isAm = cleanInput.contains('am');
    final timeOnly = cleanInput.replaceAll('am', '').replaceAll('pm', '').trim();

    int? hours;
    int? minutes;

    // 3. Try standard separator formats: "17:38", "5:38", "17.38", "5 38"
    final separatorMatch = RegExp(r'^(\d{1,2})[:.\s](\d{2})$').firstMatch(timeOnly);
    if (separatorMatch != null) {
      hours = int.tryParse(separatorMatch.group(1)!);
      minutes = int.tryParse(separatorMatch.group(2)!);
    }

    // 4. Try compact formats: "1738", "538"
    if (hours == null) {
      final compactMatch = RegExp(r'^(\d{1,2})(\d{2})$').firstMatch(timeOnly);
      if (compactMatch != null) {
        hours = int.tryParse(compactMatch.group(1)!);
        minutes = int.tryParse(compactMatch.group(2)!);
      }
    }

    // 5. Try hour-only formats: "5 pm", "17"
    if (hours == null) {
      final hourOnlyMatch = RegExp(r'^(\d{1,2})$').firstMatch(timeOnly);
      if (hourOnlyMatch != null) {
        hours = int.tryParse(hourOnlyMatch.group(1)!);
        minutes = 0;
      }
    }

    // Basic null check
    if (hours == null || minutes == null) return null;
    if (minutes < 0 || minutes > 59) return null;

    // 6. Convert 12-hour AM/PM to 24-hour time
    if (isPm || isAm) {
      if (hours < 1 || hours > 12) return null;
      if (isPm && hours < 12) hours += 12;
      if (isAm && hours == 12) hours = 0;
    } else {
      if (hours < 0 || hours > 23) return null;
    }

    // 7. Construct a valid DateTime using today's date context
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hours, minutes);
  }
}