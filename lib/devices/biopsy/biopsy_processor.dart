import '../../../core/enums/biopsy_state.dart';
import 'biopsy_result.dart';

class BiopsyProcessor {
  BiopsyState _state = BiopsyState.free;

  int _sampleCount = 0;

  BiopsyResult get result => BiopsyResult(
    state: _state,
    sampleCount: _sampleCount,
    completedEvent: false,
  );

  BiopsyResult handleClick() {
    switch (_state) {
      case BiopsyState.free:
        _state = BiopsyState.armed;

        return BiopsyResult(
          state: _state,
          sampleCount: _sampleCount,
          completedEvent: false,
          durationMs: 0,
        );

      case BiopsyState.armed:
        _state = BiopsyState.fired;
        _sampleCount++;

        return BiopsyResult(
          state: _state,
          sampleCount: _sampleCount,
          completedEvent: true,
        );

      case BiopsyState.fired:
        return BiopsyResult(
          state: _state,
          sampleCount: _sampleCount,
          completedEvent: false,
          durationMs: 0,
        );
    }
  }

  void setFree() {
    _state = BiopsyState.free;
  }

  void reset() {
    _state = BiopsyState.free;
    _sampleCount = 0;
  }
}
