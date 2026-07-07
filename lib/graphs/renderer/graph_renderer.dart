import 'package:flutter/material.dart';

import '../graph_type.dart';
import '../models/device_graph.dart';

import '../widgets/event_history_graph.dart';
import '../widgets/timeline_graph.dart';
import '../models/event_force.dart';
import '../../models/timeline_event_model.dart';

class GraphRenderer extends StatelessWidget {
  final DeviceGraph graph;

  const GraphRenderer({super.key, required this.graph});

  Widget _buildGraph() {
    switch (graph.type) {
      case GraphType.liveForce:
        return const SizedBox.shrink();

      case GraphType.forceHistory:
        return EventHistoryGraph(
          events: (graph.data as List<EventForce>?) ?? [],
        );

      case GraphType.timeline:
        return TimelineGraph(
          events: (graph.data as List<TimelineEventModel>?) ?? [],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              graph.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            _buildGraph(),
          ],
        ),
      ),
    );
  }
}
