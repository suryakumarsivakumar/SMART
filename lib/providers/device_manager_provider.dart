import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../devices/manager/device_manager.dart';

final deviceManagerProvider = Provider<DeviceManager>((ref) {
  return DeviceManager();
});
