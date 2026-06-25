class PdfUtils {
  static String formatDate(DateTime? date) {
    if (date == null) return 'N/A';

    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  static String formatTime(DateTime? date) {
    if (date == null) return 'N/A';

    return '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}:'
        '${date.second.toString().padLeft(2, '0')}';
  }

  static String formatDateTime(DateTime? date) {
    if (date == null) return 'N/A';

    return '${formatDate(date)} ${formatTime(date)}';
  }

  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${hours}h ${minutes}m ${seconds}s';
  }
}
