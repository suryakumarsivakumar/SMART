import 'package:flutter/material.dart';

import 'device_type.dart';

class DeviceInfo {
  final DeviceType type;

  final String displayName;

  final IconData icon;

  final Color color;

  final bool supportsVoice;

  final bool supportsQr;

  final bool supportsForceSensor;

  final bool supportsAnalytics;

  const DeviceInfo({
    required this.type,
    required this.displayName,
    required this.icon,
    required this.color,
    this.supportsVoice = true,
    this.supportsQr = true,
    this.supportsForceSensor = true,
    this.supportsAnalytics = true,
  });
}
