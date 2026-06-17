import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/device_data_model.dart';

class Esp32Service {
  static const String baseIp = '192.168.4.1';

  static String get deviceUrl => 'http://$baseIp/data';

  final StreamController<DeviceDataModel> _streamController =
      StreamController<DeviceDataModel>.broadcast();

  Timer? _pollingTimer;

  Stream<DeviceDataModel> get dataStream => _streamController.stream;

  Future<bool> testConnection() async {
    try {
      print('Testing connection to: $deviceUrl');

      final response = await http.get(Uri.parse(deviceUrl));

      print('Response status: ${response.statusCode}');

      print('Response body: ${response.body}');

      return response.statusCode == 200;
    } catch (e) {
      print('Connection error: $e');

      return false;
    }
  }

  void startMonitoring() {
    _pollingTimer?.cancel();

    _pollingTimer = Timer.periodic(
      const Duration(milliseconds: 250),
      (_) => _fetchData(),
    );
  }

  Future<void> _fetchData() async {
    try {
      final response = await http.get(Uri.parse(deviceUrl));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        final data = DeviceDataModel.fromJson(json);

        _streamController.add(data);
      }
    } catch (e) {
      print('Polling error: $e');
    }
  }

  void stopMonitoring() {
    _pollingTimer?.cancel();
  }

  void dispose() {
    _pollingTimer?.cancel();

    _streamController.close();
  }
}
