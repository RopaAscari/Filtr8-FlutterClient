import '../../services/api.dart';
import '../../widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../../services//hexConverter.dart';
import '../../widgets/statisticsStartContainer.dart';
import '../../widgets/statisticsChartContainer.dart';
import '../../widgets/statisticsBottomContainer.dart';

class Statistics extends StatefulWidget {
  Statistics({Key, key, this.title, this.gullies}) : super(key: key);

  final List<dynamic> gullies;
  final String title;

  @override
  StatisticsScreen createState() => StatisticsScreen();
}

class StatisticsScreen extends State<Statistics> {
  bool loading = true;
  List<dynamic> statistics;

  @override
  void initState() {
    statis();
    super.initState();
  }

  @override
  void dispose() {
    statis();
    super.dispose();
  }

  void statis() {
    Api().getStatistics().then((stats) {
      setState(() {
        statistics = stats;
        getWeight(statistics);
        loading = false;
      });
    });
  }

  void getWeight(statistics) {
    for (var a = 0; a < statistics.length; a++) {
      total += statistics[a]['weight'];
      // print(total);
    }
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int check = 0;
  int total = 0;
  int weight = 0;
  bool today = false;
  bool week = false;
  bool month = false;

  final List<String> colors = <String>[
    '#1ACCE1',
    '#965EFF',
    '#4497FD',
    '#74A53F',
    '#CEDC2B',
    '#D66A10'
  ];

  String gullies;
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Menu(),
      body: SingleChildScrollView(
          // mainAxisAlignment: MainAxisAlignment.start,
          child: Column(children: <Widget>[
        StatStartContainer(_drawerKey),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      setState(() {
                        total = 1000;
                        today = true;
                        week = false;
                        month = false;
                      });
                    },
                    child: Column(children: <Widget>[
                      Text("TODAY",
                          style: TextStyle(
                              fontSize: 18, color: HexToColor('#707070'))),
                      today
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                              child: Image.asset('assets/gradient.png'))
                          : Text(''),
                    ])),
                InkWell(
                    onTap: () {
                      getWeight(statistics);
                      setState(() {
                        total = 2340;
                        month = false;
                        today = false;
                        week = true;
                      });
                    },
                    child: Column(children: <Widget>[
                      Text("WEEK",
                          style: TextStyle(
                              fontSize: 18, color: HexToColor('#707070'))),
                      week
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Image.asset('assets/gradient.png'))
                          : Text(''),
                    ])),
                InkWell(
                    onTap: () {
                      setState(() {
                        total = 3456;
                        month = true;
                        today = false;
                        week = false;
                        getWeight(statistics);
                      });
                    },
                    child: Column(children: <Widget>[
                      Text("MONTH",
                          style: TextStyle(
                              fontSize: 18, color: HexToColor('#707070'))),
                      month
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Image.asset('assets/gradient.png'))
                          : Text(''),
                    ]))
              ],
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: StatChartContainer(total, check, colors)),
        Text("\n"),
        loading
            ? new CircularProgressIndicator(
                backgroundColor: Colors.red,
              )
            : StatisticsBottomContainer(widget.gullies, statistics, colors),
        Text("\n"),
        new Row(children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                iconSize: 23.0,
                onPressed: () => Navigator.pop(context),
              )),
          Text(
            "Back",
            style: TextStyle(fontStyle: FontStyle.italic),
          )
        ]),
      ])),
    );
  }
}
