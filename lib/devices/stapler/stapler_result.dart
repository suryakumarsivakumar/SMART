import '../../../core/enums/stapler_state.dart';

class StaplerResult {
  final StaplerState state;

  final int fireCount;

  final bool completedEvent;

  final double durationMs;

  const StaplerResult({
    required this.state,
    required this.fireCount,
    required this.completedEvent,
    this.durationMs = 0,
  });
}
