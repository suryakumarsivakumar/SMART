import 'package:flutter/material.dart';

import '../../models/timeline_event_model.dart';

class TimelineGraph extends StatelessWidget {
  final List<TimelineEventModel> events;

  const TimelineGraph({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final e = events[index];

          return ListTile(
            leading: const Icon(Icons.circle, size: 10),
            title: Text(e.event),
            subtitle: Text(e.timestamp.toString()),
          );
        },
      ),
    );
  }
}
