import 'package:flutter/material.dart';
import '../services/hexConverter.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class StatChartContainer extends StatelessWidget {
  final int _weight;
  final int check;
  final List<String> colors;
  StatChartContainer(this._weight, this.check, this.colors);

  Widget build(BuildContext context) {
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [HexToColor("#147EB1"), HexToColor("#0A2387")])),
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 2.7,
      child: new Stack(
        children: <Widget>[
          new Align(
              alignment: Alignment.center,
              child: new AnimatedCircularChart(
                key: _chartKey,
                size: const Size(350.0, 900.0),
                holeRadius: 95,
                initialChartData: <CircularStackEntry>[
                  new CircularStackEntry(
                    <CircularSegmentEntry>[
                      new CircularSegmentEntry(
                        20,
                        HexToColor(colors[0]),
                        rankKey: 'completed',
                      ),
                      new CircularSegmentEntry(
                        20,
                        HexToColor(colors[1]),
                        rankKey: 'remaining',
                      ),
                      new CircularSegmentEntry(
                        20,
                        HexToColor(colors[2]),
                        rankKey: 'remainingx2',
                      ),
                      new CircularSegmentEntry(
                        20,
                        HexToColor(colors[3]),
                        rankKey: 'remainingx2',
                      ),
                      new CircularSegmentEntry(
                        20,
                        HexToColor(colors[4]),
                        rankKey: 'remainingx2',
                      ),
                    ],
                    rankKey: 'progress',
                  )
                ],
                chartType: CircularChartType.Radial,
                percentageValues: true,
                holeLabel: '',
                labelStyle: new TextStyle(
                  color: Colors.blueGrey[600],
                  // fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              )),
          new Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: '$_weight \n',
                  style: TextStyle(color: HexToColor("#78849E"), fontSize: 54),
                  children: <TextSpan>[
                    TextSpan(
                      text: '             Total Kg',
                      style: TextStyle(
                        color: HexToColor("#78849E"),
                        fontSize: 14,
                      ),
                      //recognizer: _longPressRecognizer,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
