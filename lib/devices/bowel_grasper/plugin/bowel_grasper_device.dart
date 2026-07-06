import '../../core/surgical_device.dart';
import '../../registry/device_info.dart';
import '../../registry/device_registry.dart';
import '../../registry/device_type.dart';
import '../../core/device_result.dart';
import '../../core/device_metric.dart';
import '../../../graphs/models/device_graph.dart';
import '../../core/empty_procedure_analytics.dart';

class BowelGrasperDevice implements SurgicalDevice {
  @override
  DeviceInfo get info => DeviceRegistry.get(DeviceType.bowelGrasper);
  @override
  String get dashboardTitle => "BOWEL GRASPER";

  @override
  String get primaryMetricLabel => "Grasps";

  @override
  String get stateLabel => "Grasper State";
  @override
  void onSelected() {}

  @override
  void onDeselected() {}

  @override
  void reset() {}

  @override
  void processSensorData(dynamic data) {}

  @override
  Map<String, dynamic> get analytics => {'grasps': 0, 'duration': 0};

  // Temporary implementations
  @override
  DeviceResult handleClick() {
    return const DeviceResult(
      state: 'free',
      primaryCount: 0,
      primaryLabel: 'Grasps',
    );
  }

  @override
  DeviceResult get result => const DeviceResult(
    state: 'free',
    primaryCount: 0,
    primaryLabel: 'Grasps',
  );

  @override
  void setFree() {}

  @override
  List<DeviceMetric> get metrics => [
    const DeviceMetric(label: "Grasps", value: "0"),
  ];

  @override
  List<DeviceGraph> get graphs => const [];

  final EmptyProcedureAnalytics _analytics = EmptyProcedureAnalytics();

  @override
  EmptyProcedureAnalytics get procedureAnalytics => _analytics;

  @override
  List<DeviceGraph> buildGraphs() => [];
}
