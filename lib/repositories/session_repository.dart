import 'package:hive/hive.dart';

import '../models/session_model.dart';

class SessionRepository {
  final Box<SessionModel> box = Hive.box<SessionModel>('sessions');

  Future<void> save(SessionModel session) async {
    await box.put(session.sessionId, session);
  }

  List<SessionModel> getAll() {
    return box.values.toList();
  }
}
