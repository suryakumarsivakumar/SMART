import 'package:flutter/material.dart';

import '../../models/graph_point.dart';
import '../widgets/live_force_graph.dart';

class LiveGraphRenderer extends StatelessWidget {
  final List<GraphPoint> points;

  const LiveGraphRenderer({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Live Force",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            LiveForceGraph(points: points),
          ],
        ),
      ),
    );
  }
}
