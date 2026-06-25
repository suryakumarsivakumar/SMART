import '../../../core/enums/biopsy_state.dart';
import 'biopsy_result.dart';

class BiopsyProcessor {
  BiopsyState _state = BiopsyState.free;

  int _sampleCount = 0;

  BiopsyResult get result =>
      BiopsyResult(state: _state, sampleCount: _sampleCount);

  BiopsyResult handleClick() {
    switch (_state) {
      case BiopsyState.free:
        _state = BiopsyState.armed;
        break;

      case BiopsyState.armed:
        _state = BiopsyState.fired;
        _sampleCount++;
        break;

      case BiopsyState.fired:
        break;
    }

    return result;
  }

  void setFree() {
    _state = BiopsyState.free;
  }

  void reset() {
    _state = BiopsyState.free;
    _sampleCount = 0;
  }
}
