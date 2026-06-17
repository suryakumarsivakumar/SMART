import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/enums/connection_status.dart';

final connectionProvider = StateProvider<ConnectionStatus>(
  (ref) => ConnectionStatus.disconnected,
);
