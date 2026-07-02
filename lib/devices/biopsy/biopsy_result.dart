import '../../../core/enums/biopsy_state.dart';

class BiopsyResult {
  final BiopsyState state;
  final int sampleCount;

  const BiopsyResult({required this.state, required this.sampleCount});
}
