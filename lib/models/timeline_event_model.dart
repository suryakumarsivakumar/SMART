import 'package:hive/hive.dart';

part 'timeline_event_model.g.dart';

@HiveType(typeId: 5)
class TimelineEventModel extends HiveObject {
  @HiveField(0)
  String device;

  @HiveField(1)
  String event;

  @HiveField(2)
  DateTime timestamp;

  TimelineEventModel({
    required this.device,
    required this.event,
    required this.timestamp,
  });
}
