import 'procedure_analytics.dart';

class EmptyProcedureAnalytics implements ProcedureAnalytics {
  @override
  void clear() {}

  @override
  void recordEvent({
    required int eventNumber,
    required double peakForce,
    required DateTime timestamp,
  }) {}
}
