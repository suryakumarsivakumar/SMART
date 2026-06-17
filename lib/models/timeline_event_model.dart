import 'package:hive/hive.dart';

part 'timeline_event_model.g.dart';

@HiveType(typeId: 5)
class TimelineEventModel extends HiveObject {
  @HiveField(0)
  String event;

  @HiveField(1)
  DateTime timestamp;

  TimelineEventModel({required this.event, required this.timestamp});
}
