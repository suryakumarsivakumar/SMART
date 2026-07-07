import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/timeline_event_model.dart';

class TimelineGraph extends StatelessWidget {
  final List<TimelineEventModel> events;

  const TimelineGraph({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('HH:mm:ss');

    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: events.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final e = events[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 14,
              child: Text("${index + 1}", style: const TextStyle(fontSize: 12)),
            ),

            title: Text(
              e.event,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            subtitle: Text(formatter.format(e.timestamp)),
          );
        },
      ),
    );
  }
}
