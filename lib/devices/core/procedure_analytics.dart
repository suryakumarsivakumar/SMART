abstract class ProcedureAnalytics {
  void clear();

  void recordEvent({
    required int eventNumber,
    required double peakForce,

    required DateTime timestamp,
  });
}
