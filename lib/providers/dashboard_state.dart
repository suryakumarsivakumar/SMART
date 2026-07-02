import '../models/device_data_model.dart';
import '../core/enums/biopsy_state.dart';
import '../models/graph_point.dart';
import '../devices/registry/device_type.dart';

class DashboardState {
  final DeviceDataModel? latestData;

  final int totalPressCount;

  final double averageForce;

  final double maxForce;

  final List<GraphPoint> graphPoints;

  final Duration usageDuration;
  final BiopsyState biopsyState;

  final int biopsySampleCount;
  final bool procedureEnded;
  final DeviceType selectedDevice;

  final String selectedDeviceName;
  final String primaryMetricLabel;
  const DashboardState({
    required this.procedureEnded,
    required this.graphPoints,
    required this.latestData,
    required this.totalPressCount,
    required this.averageForce,
    required this.maxForce,
    required this.usageDuration,
    required this.biopsyState,
    required this.biopsySampleCount,
    required this.selectedDevice,
    required this.selectedDeviceName,
    this.primaryMetricLabel = '',
  });

  factory DashboardState.initial() {
    return const DashboardState(
      procedureEnded: false,
      graphPoints: [],
      biopsyState: BiopsyState.free,
      biopsySampleCount: 0,
      latestData: null,
      totalPressCount: 0,
      averageForce: 0,
      maxForce: 0,
      usageDuration: Duration.zero,
      selectedDevice: DeviceType.unknown,
      selectedDeviceName: 'No Device Selected',
      primaryMetricLabel: 'Count',
    );
  }

  DashboardState copyWith({
    bool? procedureEnded,
    List<GraphPoint>? graphPoints,
    BiopsyState? biopsyState,
    int? biopsySampleCount,
    DeviceDataModel? latestData,
    int? totalPressCount,
    double? averageForce,
    double? maxForce,
    Duration? usageDuration,
    DeviceType? selectedDevice,
    String? selectedDeviceName,
    String? primaryMetricLabel,
  }) {
    return DashboardState(
      procedureEnded: procedureEnded ?? this.procedureEnded,
      graphPoints: graphPoints ?? this.graphPoints,
      biopsyState: biopsyState ?? this.biopsyState,

      biopsySampleCount: biopsySampleCount ?? this.biopsySampleCount,
      latestData: latestData ?? this.latestData,
      totalPressCount: totalPressCount ?? this.totalPressCount,
      averageForce: averageForce ?? this.averageForce,
      maxForce: maxForce ?? this.maxForce,
      usageDuration: usageDuration ?? this.usageDuration,
      selectedDevice: selectedDevice ?? this.selectedDevice,
      selectedDeviceName: selectedDeviceName ?? this.selectedDeviceName,
      primaryMetricLabel: primaryMetricLabel ?? this.primaryMetricLabel,
    );
  }
}
