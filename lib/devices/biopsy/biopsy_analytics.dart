import '../../graphs/models/event_force.dart';
import '../../models/timeline_event_model.dart';
import '../core/procedure_analytics.dart';

class BiopsyAnalytics implements ProcedureAnalytics {
  final List<EventForce> _forceHistory = [];

  final List<TimelineEventModel> _timeline = [];

  List<EventForce> get forceHistory => List.unmodifiable(_forceHistory);

  List<TimelineEventModel> get timeline => List.unmodifiable(_timeline);
  @override
  void recordEvent({
    required int eventNumber,
    required double peakForce,

    required DateTime timestamp,
  }) {
    addShot(
      sampleNumber: eventNumber,
      peakForce: peakForce,

      timestamp: timestamp,
    );
  }

  void addShot({
    required int sampleNumber,
    required double peakForce,

    required DateTime timestamp,
  }) {
    if (sampleNumber <= 0) return;
    if (_forceHistory.isNotEmpty && _forceHistory.last.event == sampleNumber) {
      return;
    }
    _forceHistory.add(EventForce(event: sampleNumber, peakForce: peakForce));

    _timeline.add(
      TimelineEventModel(
        device: "Biopsy Gun",
        event: "Sample $sampleNumber Completed",
        timestamp: timestamp,
      ),
    );
  }

  @override
  void clear() {
    _forceHistory.clear();
    _timeline.clear();
  }
}
