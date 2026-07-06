abstract class ProcedureAnalytics {
  void clear();

  void recordEvent({
    required int eventNumber,
    required double peakForce,
    required double durationMs,
    required DateTime timestamp,
  });
}
