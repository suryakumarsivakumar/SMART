import 'device_result.dart';
import '../registry/device_info.dart';
import 'device_metric.dart';

abstract class SurgicalDevice {
  DeviceInfo get info;

  String get dashboardTitle;

  String get primaryMetricLabel;
  String get stateLabel;

  DeviceResult get result;

  void onSelected();

  void onDeselected();

  void reset();

  void processSensorData(dynamic data);

  DeviceResult handleClick();

  void setFree();

  Map<String, dynamic> get analytics;

  List<DeviceMetric> get metrics;
}
