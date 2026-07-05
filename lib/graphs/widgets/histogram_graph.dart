import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/histogram_point.dart';

class HistogramGraph extends StatelessWidget {
  final List<HistogramPoint> values;

  const HistogramGraph({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SfCartesianChart(
        title: ChartTitle(text: 'Force Distribution'),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0),
        series: <ColumnSeries<HistogramPoint, String>>[
          ColumnSeries<HistogramPoint, String>(
            dataSource: values,
            xValueMapper: (HistogramPoint p, _) => p.range,
            yValueMapper: (HistogramPoint p, _) => p.count,
          ),
        ],
      ),
    );
  }
}
