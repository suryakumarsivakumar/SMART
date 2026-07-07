import 'device_result.dart';
import '../registry/device_info.dart';
import 'device_metric.dart';
import '../../graphs/models/device_graph.dart';
import 'procedure_analytics.dart';
import 'package:flutter/material.dart';

abstract class SurgicalDevice {
  DeviceInfo get info;

  String get dashboardTitle;

  String get primaryMetricLabel;
  String get statusCardTitle;
  String get imageAsset;
  IconData get stateIcon;
  DeviceResult get result;
  Color get stateColor;

  void onSelected();

  void onDeselected();

  void reset();

  void processSensorData(dynamic data);

  DeviceResult handleClick();

  void setFree();

  Map<String, dynamic> get analytics;

  List<DeviceMetric> get metrics;

  List<DeviceGraph> get graphs;

  List<DeviceGraph> buildGraphs();

  ProcedureAnalytics get procedureAnalytics;
}
