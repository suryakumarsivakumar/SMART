import '../../core/device_result.dart';
import '../../core/surgical_device.dart';
import '../../registry/device_info.dart';
import '../../registry/device_registry.dart';
import '../../registry/device_type.dart';
import '../../core/device_metric.dart';
import '../../../graphs/models/device_graph.dart';

class NoDevice implements SurgicalDevice {
  @override
  DeviceInfo get info => DeviceRegistry.get(DeviceType.unknown);

  @override
  String get dashboardTitle => "NO DEVICE SELECTED";

  @override
  String get primaryMetricLabel => "";

  @override
  String get stateLabel => "Status";

  @override
  List<DeviceMetric> get metrics => const [];

  @override
  DeviceResult get result =>
      const DeviceResult(state: "idle", primaryCount: 0, primaryLabel: "");

  @override
  void onSelected() {}

  @override
  void onDeselected() {}

  @override
  void reset() {}

  @override
  void processSensorData(dynamic data) {}

  @override
  DeviceResult handleClick() {
    return result;
  }

  @override
  void setFree() {}

  @override
  Map<String, dynamic> get analytics => {};

  @override
  List<DeviceGraph> get graphs => const [];

  @override
  Object get procedureAnalytics => Object();
}
