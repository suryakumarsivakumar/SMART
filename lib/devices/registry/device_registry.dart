import 'package:flutter/material.dart';

import 'device_info.dart';
import 'device_type.dart';

class DeviceRegistry {
  static const Map<DeviceType, DeviceInfo> devices = {
    DeviceType.biopsyGun: DeviceInfo(
      type: DeviceType.biopsyGun,
      displayName: 'Biopsy Gun',
      icon: Icons.medical_services,
      color: Colors.blue,
    ),

    DeviceType.bowelGrasper: DeviceInfo(
      type: DeviceType.bowelGrasper,
      displayName: 'Bowel Grasper',
      icon: Icons.pan_tool_alt,
      color: Colors.green,
    ),

    DeviceType.dissector: DeviceInfo(
      type: DeviceType.dissector,
      displayName: 'Dissector',
      icon: Icons.content_cut,
      color: Colors.deepPurple,
    ),

    DeviceType.trocar: DeviceInfo(
      type: DeviceType.trocar,
      displayName: 'Trocar',
      icon: Icons.adjust,
      color: Colors.orange,
    ),

    DeviceType.stapler: DeviceInfo(
      type: DeviceType.stapler,
      displayName: 'Surgical Stapler',
      icon: Icons.construction,
      color: Colors.deepOrange,
      supportsVoice: true,
      supportsQr: false,
      supportsForceSensor: true,
      supportsAnalytics: true,
    ),

    DeviceType.forceps: DeviceInfo(
      type: DeviceType.forceps,
      displayName: 'Forceps',
      icon: Icons.build,
      color: Colors.teal,
    ),

    DeviceType.needleHolder: DeviceInfo(
      type: DeviceType.needleHolder,
      displayName: 'Needle Holder',
      icon: Icons.architecture,
      color: Colors.brown,
    ),

    DeviceType.suction: DeviceInfo(
      type: DeviceType.suction,
      displayName: 'Suction',
      icon: Icons.air,
      color: Colors.cyan,
    ),

    DeviceType.scissors: DeviceInfo(
      type: DeviceType.scissors,
      displayName: 'Scissors',
      icon: Icons.content_cut,
      color: Colors.pink,
    ),

    DeviceType.unknown: DeviceInfo(
      type: DeviceType.unknown,
      displayName: 'No Device Selected',
      icon: Icons.help_outline,
      color: Colors.grey,
      supportsVoice: false,
      supportsQr: false,
      supportsForceSensor: false,
      supportsAnalytics: false,
    ),
  };

  static DeviceInfo get(DeviceType type) =>
      devices[type] ?? devices[DeviceType.unknown]!;
}
