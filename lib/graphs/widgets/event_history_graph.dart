import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/event_force.dart';

class EventHistoryGraph extends StatelessWidget {
  final List<EventForce> events;

  const EventHistoryGraph({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SfCartesianChart(
        title: ChartTitle(text: 'Peak Force History'),
        primaryXAxis: NumericAxis(title: AxisTitle(text: 'Event')),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Peak Force'),
          minimum: 0,
        ),
        series: <ColumnSeries<EventForce, double>>[
          ColumnSeries<EventForce, double>(
            dataSource: events,
            xValueMapper: (EventForce e, _) => e.event.toDouble(),
            yValueMapper: (EventForce e, _) => e.peakForce,
          ),
        ],
      ),
    );
  }
}
