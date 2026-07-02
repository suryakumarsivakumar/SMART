import '../../core/enums/stapler_state.dart';

class StaplerResult {
  final StaplerState state;
  final int fireCount;

  const StaplerResult({required this.state, required this.fireCount});
}
