import 'package:hive/hive.dart';

import '../models/force_data_model.dart';

class AnalyticsRepository {
  final Box<ForceDataModel> box = Hive.box<ForceDataModel>('force_data');

  Future<void> saveForce(ForceDataModel data) async {
    await box.add(data);
  }

  List<ForceDataModel> getAllForceData() {
    return box.values.toList();
  }
}
