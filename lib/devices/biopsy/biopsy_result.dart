import '../../../core/enums/biopsy_state.dart';

class BiopsyResult {
  final BiopsyState state;

  final int sampleCount;

  // True only when a biopsy sample is actually completed
  final bool completedEvent;

  // Trigger hold duration
  final double durationMs;

  const BiopsyResult({
    required this.state,
    required this.sampleCount,
    this.completedEvent = false,
    this.durationMs = 0,
  });
}
