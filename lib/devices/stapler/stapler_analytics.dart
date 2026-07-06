import '../../graphs/models/event_force.dart';
import '../../graphs/models/duration_point.dart';
import '../../models/timeline_event_model.dart';
import '../core/procedure_analytics.dart';

class StaplerAnalytics implements ProcedureAnalytics {
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
    addFire(
      fireNumber: eventNumber,
      peakForce: peakForce,
      durationMs: durationMs,
      timestamp: timestamp,
    );
  }

  void addFire({
    required int fireNumber,
    required double peakForce,
    required double durationMs,
    required DateTime timestamp,
  }) {
    _forceHistory.add(EventForce(event: fireNumber, peakForce: peakForce));

    _durationHistory.add(
      DurationPoint(event: fireNumber, duration: durationMs),
    );

    _timeline.add(
      TimelineEventModel(event: "Fire $fireNumber", timestamp: timestamp),
    );
  }

  @override
  void clear() {
    _forceHistory.clear();
    _durationHistory.clear();
    _timeline.clear();
  }
}
