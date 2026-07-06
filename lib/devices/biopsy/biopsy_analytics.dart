import '../../graphs/models/event_force.dart';
import '../../graphs/models/duration_point.dart';
import '../../models/timeline_event_model.dart';
import '../core/procedure_analytics.dart';

class BiopsyAnalytics implements ProcedureAnalytics {
  final List<EventForce> _forceHistory = [];

  final List<DurationPoint> _durationHistory = [];

  final List<TimelineEventModel> _timeline = [];

  List<EventForce> get forceHistory => List.unmodifiable(_forceHistory);

  List<DurationPoint> get durationHistory =>
      List.unmodifiable(_durationHistory);

  List<TimelineEventModel> get timeline => List.unmodifiable(_timeline);
  @override
  void recordEvent({
    required int eventNumber,
    required double peakForce,
    required double durationMs,
    required DateTime timestamp,
  }) {
    addShot(
      sampleNumber: eventNumber,
      peakForce: peakForce,
      durationMs: durationMs,
      timestamp: timestamp,
    );
  }

  void addShot({
    required int sampleNumber,
    required double peakForce,
    required double durationMs,
    required DateTime timestamp,
  }) {
    _forceHistory.add(EventForce(event: sampleNumber, peakForce: peakForce));

    _durationHistory.add(
      DurationPoint(event: sampleNumber, duration: durationMs),
    );

    _timeline.add(
      TimelineEventModel(event: "Sample $sampleNumber", timestamp: timestamp),
    );
  }

  @override
  void clear() {
    _forceHistory.clear();
    _durationHistory.clear();
    _timeline.clear();
  }
}
