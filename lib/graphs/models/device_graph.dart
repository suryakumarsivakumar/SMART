import '../graph_type.dart';

class DeviceGraph {
  final GraphType type;

  final dynamic data;

  final String title;

  const DeviceGraph({required this.type, required this.title, this.data});
}
