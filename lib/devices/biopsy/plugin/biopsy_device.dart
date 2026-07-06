import '../../core/surgical_device.dart';
import '../../registry/device_info.dart';
import '../../registry/device_registry.dart';
import '../../registry/device_type.dart';
import '../biopsy_processor.dart';
import '../../core/device_result.dart';
import '../../core/device_metric.dart';
import '../../../graphs/models/device_graph.dart';
import '../../../graphs/graph_type.dart';
import '../biopsy_analytics.dart';
import '../../../graphs/models/event_force.dart';
import '../../../graphs/models/duration_point.dart';
import '../../../models/timeline_event_model.dart';

class BiopsyDevice implements SurgicalDevice {
  final BiopsyProcessor _processor = BiopsyProcessor();
  final BiopsyAnalytics deviceAnalytics = BiopsyAnalytics();
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
    DeviceMetric(label: 'Samples', value: result.primaryCount.toString()),
    DeviceMetric(label: 'State', value: result.state.toUpperCase()),
  ];
  @override
  List<DeviceGraph> get graphs => buildGraphs();
  @override
  List<DeviceGraph> buildGraphs() {
    return [
      DeviceGraph(type: GraphType.liveForce, title: "Live Force"),

      DeviceGraph(
        type: GraphType.forceHistory,
        title: "Biopsy Force History",
        data: List<EventForce>.from(deviceAnalytics.forceHistory),
      ),

      DeviceGraph(
        type: GraphType.durationTrend,
        title: "Press Duration",
        data: List<DurationPoint>.from(deviceAnalytics.durationHistory),
      ),

      DeviceGraph(
        type: GraphType.timeline,
        title: "Procedure Timeline",
        data: List<TimelineEventModel>.from(deviceAnalytics.timeline),
      ),
    ];
  }

  @override
  BiopsyAnalytics get procedureAnalytics => deviceAnalytics;
}
