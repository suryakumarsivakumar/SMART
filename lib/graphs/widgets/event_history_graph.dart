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
        primaryXAxis: NumericAxis(title: AxisTitle(text: "Event")),
        primaryYAxis: NumericAxis(title: AxisTitle(text: "Peak Force")),
        series: <ColumnSeries<EventForce, int>>[
          ColumnSeries<EventForce, int>(
            dataSource: events,
            xValueMapper: (point, _) => point.event,
            yValueMapper: (point, _) => point.peakForce,
          ),
        ],
      ),
    );
  }
}
