import 'package:hive/hive.dart';

part 'recording_model.g.dart';

@HiveType(typeId: 6)
class RecordingModel extends HiveObject {
  @HiveField(0)
  String recordingId;

  @HiveField(1)
  String sessionId;

  @HiveField(2)
  String videoPath;

  @HiveField(3)
  DateTime createdAt;

  RecordingModel({
    required this.recordingId,
    required this.sessionId,
    required this.videoPath,
    required this.createdAt,
  });
}
