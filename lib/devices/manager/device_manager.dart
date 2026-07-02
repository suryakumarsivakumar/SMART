import '../core/surgical_device.dart';
import '../factory/device_factory.dart';
import '../registry/device_info.dart';
import '../registry/device_registry.dart';
import '../registry/device_type.dart';
import '../core/device_metric.dart';

class DeviceManager {
  DeviceType _currentDevice = DeviceType.unknown;

  late SurgicalDevice _currentPlugin = DeviceFactory.create(_currentDevice);

  DeviceType get currentDevice => _currentDevice;

  SurgicalDevice get currentPlugin => _currentPlugin;

  DeviceInfo get currentInfo => DeviceRegistry.get(_currentDevice);

  String get dashboardTitle => currentPlugin.dashboardTitle;

  String get primaryMetricLabel => currentPlugin.primaryMetricLabel;

  String get stateLabel => currentPlugin.stateLabel;

  List<DeviceMetric> get metrics => currentPlugin.metrics;

  void selectDevice(DeviceType type) {
    _currentPlugin.onDeselected();

    _currentDevice = type;

    _currentPlugin = DeviceFactory.create(type);

    _currentPlugin.onSelected();
  }
}
