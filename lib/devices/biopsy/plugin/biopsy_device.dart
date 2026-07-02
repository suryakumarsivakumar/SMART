import '../../core/surgical_device.dart';
import '../../registry/device_info.dart';
import '../../registry/device_registry.dart';
import '../../registry/device_type.dart';
import '../biopsy_processor.dart';
import '../../core/device_result.dart';
import '../../core/device_metric.dart';

class BiopsyDevice implements SurgicalDevice {
  final BiopsyProcessor _processor = BiopsyProcessor();

  @override
  DeviceInfo get info => DeviceRegistry.get(DeviceType.biopsyGun);
  @override
  String get dashboardTitle => "BIOPSY DEVICE";

  @override
  String get primaryMetricLabel => "Samples";

  @override
  String get stateLabel => "Device State";

  @override
  DeviceResult handleClick() {
    final result = _processor.handleClick();

    return DeviceResult(
      state: result.state.name,
      primaryCount: result.sampleCount,
      primaryLabel: "Samples",
    );
  }

  @override
  void setFree() {
    _processor.setFree();
  }

  @override
  DeviceResult get result {
    final result = _processor.result;

    return DeviceResult(
      state: result.state.name,
      primaryCount: result.sampleCount,
      primaryLabel: "Samples",
    );
  }

  @override
  void onSelected() {
    _processor.reset();
  }

  @override
  void onDeselected() {}

  @override
  void reset() {
    _processor.reset();
  }

  @override
  void processSensorData(dynamic data) {}

  @override
  Map<String, dynamic> get analytics => {
    'sampleCount': _processor.result.sampleCount,
    'state': _processor.result.state.name,
  };

  @override
  List<DeviceMetric> get metrics => [
    DeviceMetric(
      label: "Samples",
      value: _processor.result.sampleCount.toString(),
    ),
  ];
}
