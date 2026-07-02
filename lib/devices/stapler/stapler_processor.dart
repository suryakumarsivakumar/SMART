import '../../core/enums/stapler_state.dart';
import 'stapler_result.dart';

class StaplerProcessor {
  StaplerState _state = StaplerState.idle;

  int _fireCount = 0;

  StaplerResult get result =>
      StaplerResult(state: _state, fireCount: _fireCount);

  void reset() {
    _state = StaplerState.idle;
    _fireCount = 0;
  }

  StaplerResult handleClick() {
    switch (_state) {
      case StaplerState.idle:
        _state = StaplerState.firing;
        break;

      case StaplerState.firing:
        _state = StaplerState.fired;
        _fireCount++;
        break;

      case StaplerState.fired:
        break;
    }

    return result;
  }

  void setIdle() {
    _state = StaplerState.idle;
  }
}
