import 'package:flutter/material.dart';
import '../services/hexConverter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class RiverChart extends StatelessWidget {
  RiverChart(this.num1, this.num2, this.num3);
  final double num1, num2, num3;
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 2.7,
      child: new Stack(
        children: <Widget>[
          new Align(
            alignment: Alignment.center,
            child: new AnimatedCircularChart(
              key: _chartKey,
              size: const Size(400.0, 900.0),
              holeRadius: 35,
              initialChartData: <CircularStackEntry>[
                new CircularStackEntry(
                  <CircularSegmentEntry>[
                    new CircularSegmentEntry(
                      num3,
                      HexToColor("#126EE6"),
                      rankKey: 'completed',
                    ),
                    new CircularSegmentEntry(
                      100 - num3,
                      Colors.blueGrey[400],
                      rankKey: 'remaining',
                    ),
                  ],
                  rankKey: 'progress',
                ),
                new CircularStackEntry(
                  <CircularSegmentEntry>[
                    new CircularSegmentEntry(
                      num2,
                      HexToColor("#3B2CBE"),
                      rankKey: 'completed',
                    ),
                    new CircularSegmentEntry(
                      100 - num2,
                      Colors.blueGrey[400],
                      rankKey: 'remaining',
                    ),
                  ],
                  rankKey: 'progress',
                ),
                new CircularStackEntry(
                  <CircularSegmentEntry>[
                    new CircularSegmentEntry(
                      num1,
                      HexToColor("#5016A8"),
                      rankKey: 'completed',
                    ),
                    new CircularSegmentEntry(
                      100 - num1,
                      Colors.blueGrey[400],
                      rankKey: 'remaining',
                    ),
                  ],
                  rankKey: 'progress',
                ),
              ],
              chartType: CircularChartType.Radial,
              edgeStyle: SegmentEdgeStyle.round,
              percentageValues: true,
            ),
          ),
        ],
      ),
    );
  }
}
