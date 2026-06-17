import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/wifi/esp32_service.dart';

final esp32ServiceProvider = Provider<Esp32Service>((ref) => Esp32Service());
