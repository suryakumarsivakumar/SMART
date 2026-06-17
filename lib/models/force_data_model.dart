import 'package:hive/hive.dart';

part 'force_data_model.g.dart';

@HiveType(typeId: 4)
class ForceDataModel extends HiveObject {
  @HiveField(0)
  double force;

  @HiveField(1)
  DateTime timestamp;

  ForceDataModel({required this.force, required this.timestamp});
}
