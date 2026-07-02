import '../../core/enums/stapler_state.dart';
import 'stapler_result.dart';

class StaplerProcessor {
  StaplerState _state = StaplerState.idle;

  int _fireCount = 0;

  StaplerResult get result =>
      StaplerResult(state: _state.name, fireCount: _fireCount);

  void reset() {
    _state = StaplerState.idle;
    _fireCount = 0;
  }

  StaplerResult handleClick() {
    _fireCount++;

    _state = StaplerState.fired;

    return result;
  }

  void setIdle() {
    _state = StaplerState.idle;
  }
}
