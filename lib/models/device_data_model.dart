class DeviceDataModel {
  final int value;
  final String state;
  final bool click;
  final DateTime timestamp;

  DeviceDataModel({
    required this.value,
    required this.state,
    required this.click,
    required this.timestamp,
  });

  factory DeviceDataModel.fromJson(Map<String, dynamic> json) {
    return DeviceDataModel(
      value: json['value'] ?? 0,
      state: json['state'] ?? 'No Press',
      click: json['click'] ?? false,
      timestamp: DateTime.now(),
    );
  }
}
