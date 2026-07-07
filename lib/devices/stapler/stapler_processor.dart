import '../../core/enums/stapler_state.dart';
import 'stapler_result.dart';

class StaplerProcessor {
  StaplerState _state = StaplerState.idle;

  int _fireCount = 0;

  DateTime? _idleTime;

  StaplerResult get result => StaplerResult(
    state: _state,
    fireCount: _fireCount,
    completedEvent: false,
  );

  void reset() {
    _state = StaplerState.idle;
    _fireCount = 0;
    _idleTime = DateTime.now();
  }

  StaplerResult handleClick() {
    final now = DateTime.now();

    _idleTime ??= now;

    _fireCount++;

    _state = StaplerState.fired;

    return StaplerResult(
      state: _state,
      fireCount: _fireCount,
      completedEvent: true,
    );
  }

  void setIdle() {
    _state = StaplerState.idle;
    _idleTime = DateTime.now();
  }
}
