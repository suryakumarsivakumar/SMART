import '../biopsy/plugin/biopsy_device.dart';
import '../core/surgical_device.dart';
import '../registry/device_type.dart';
import '../unknown/plugin/no_device.dart';
import '../stapler/plugin/stapler_device.dart';

class DeviceFactory {
  static SurgicalDevice create(DeviceType type) {
    switch (type) {
      case DeviceType.unknown:
        return NoDevice();

      case DeviceType.biopsyGun:
        return BiopsyDevice();

      case DeviceType.stapler:
        return StaplerDevice();

      default:
        return NoDevice();
    }
  }
}
