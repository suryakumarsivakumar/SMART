import '../../core/surgical_device.dart';
import '../../registry/device_info.dart';
import '../../registry/device_registry.dart';
import '../../registry/device_type.dart';
import '../../../graphs/models/device_graph.dart';
import '../../core/device_result.dart';
import '../../core/device_metric.dart';
import '../../../graphs/graph_type.dart';
import '../stapler_processor.dart';
import '../stapler_analytics.dart';
import '../../../graphs/models/event_force.dart';
import '../../../graphs/models/duration_point.dart';
import '../../../models/timeline_event_model.dart';

class StaplerDevice implements SurgicalDevice {
  final StaplerProcessor _processor = StaplerProcessor();
  final StaplerAnalytics deviceAnalytics = StaplerAnalytics();

  @override
  DeviceInfo get info => DeviceRegistry.get(DeviceType.stapler);

  @override
  DeviceResult handleClick() {
    final result = _processor.handleClick();

    return DeviceResult(
      state: result.state,
      primaryCount: result.fireCount,
      primaryLabel: 'Firings',
    );
  }

  @override
  void setFree() {
    _processor.setIdle();
  }

  @override
  DeviceResult get result {
    final result = _processor.result;

    return DeviceResult(
      state: result.state,
      primaryCount: result.fireCount,
      primaryLabel: 'Firings',
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
    'fireCount': _processor.result.fireCount,
    'state': _processor.result.state,
  };

  @override
  List<DeviceMetric> get metrics => [
    DeviceMetric(
      label: 'Fire Count',
      value: _processor.result.fireCount.toString(),
    ),
    DeviceMetric(label: 'State', value: _processor.result.state.toUpperCase()),
  ];

  @override
  String get dashboardTitle => 'SURGICAL STAPLER';

  @override
  String get primaryMetricLabel => 'Firings';

  @override
  String get stateLabel => _processor.result.state.toUpperCase();
  @override
  List<DeviceGraph> get graphs => buildGraphs();
  @override
  List<DeviceGraph> buildGraphs() {
    return [
      DeviceGraph(type: GraphType.liveForce, title: "Live Force"),

      DeviceGraph(
        type: GraphType.forceHistory,
        title: "Fire Force History",
        data: List<EventForce>.from(deviceAnalytics.forceHistory),
      ),

      DeviceGraph(
        type: GraphType.durationTrend,
        title: "Fire Duration",
        data: List<DurationPoint>.from(deviceAnalytics.durationHistory),
      ),

      DeviceGraph(
        type: GraphType.timeline,
        title: "Fire Timeline",
        data: List<TimelineEventModel>.from(deviceAnalytics.timeline),
      ),
    ];
  }

  @override
  StaplerAnalytics get procedureAnalytics => deviceAnalytics;
}
