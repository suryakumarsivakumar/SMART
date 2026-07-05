import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/graph_point.dart';

class LiveForceGraph extends StatelessWidget {
  final List<GraphPoint> points;

  const LiveForceGraph({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SfCartesianChart(
        primaryXAxis: NumericAxis(title: AxisTitle(text: 'Sample')),

        primaryYAxis: NumericAxis(title: AxisTitle(text: 'Force'), minimum: 0),

        series: <LineSeries<GraphPoint, double>>[
          LineSeries<GraphPoint, double>(
            dataSource: points,

            xValueMapper: (GraphPoint point, _) => point.x,

            yValueMapper: (GraphPoint point, _) => point.y,

            width: 3,
          ),
        ],
      ),
    );
  }
}
