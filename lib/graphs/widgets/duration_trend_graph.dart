import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/duration_point.dart';

class DurationTrendGraph extends StatelessWidget {
  final List<DurationPoint> points;

  const DurationTrendGraph({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SfCartesianChart(
        title: ChartTitle(text: 'Duration Trend'),
        primaryXAxis: NumericAxis(title: AxisTitle(text: 'Event')),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Duration (ms)'),
          minimum: 0,
        ),
        series: <LineSeries<DurationPoint, double>>[
          LineSeries<DurationPoint, double>(
            dataSource: points,
            xValueMapper: (DurationPoint p, _) => p.event.toDouble(),
            yValueMapper: (DurationPoint p, _) => p.duration,
            width: 3,
          ),
        ],
      ),
    );
  }
}
