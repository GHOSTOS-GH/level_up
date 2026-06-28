// ─── Num extensions ───────────────────────────────────────────────────────────

extension NumExtensions on num {
  double clampProgress(double min, double max) {
    return toDouble().clamp(min, max).toDouble();
  }

  String toProgressString() => '${toStringAsFixed(1)}%';
}

// ─── DateTime extensions ──────────────────────────────────────────────────────

extension DateExtensions on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  int get dayOfWeekIso => weekday;

  String get formattedDate {
    return '${day.toString().padLeft(2, '0')}/'
        '${month.toString().padLeft(2, '0')}/'
        '$year';
  }

  String get formattedTime {
    return '${hour.toString().padLeft(2, '0')}:'
        '${minute.toString().padLeft(2, '0')}';
  }
}
