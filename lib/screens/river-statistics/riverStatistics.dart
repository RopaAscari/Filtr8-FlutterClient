import '../../widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../../widgets/riverChart.dart';
import '../../services/hexConverter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/riverStatisticsContainer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RiverStatistics extends StatefulWidget {
  RiverStatistics({Key, key, this.title, this.gullies}) : super(key: key);

  final String title;
  final List<dynamic> gullies;

  RiverStatScreen createState() => RiverStatScreen();
}

@override
class RiverStatScreen extends State<RiverStatistics> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  double num1 = 0, num2 = 0, num3 = 0;
  bool today = true, month = true, week = true;
  int weight1 = 0, weight2 = 0, weight3 = 0;
  String name = "Industrial Terrace gully", parish = 'west kingston';

  final List<String> gully = ["South Gully", 'Seaview Garden', 'Sandy Gully'];

  final String description =
      "The South Gully is located in Montego Bay, St James, Jamaica’s second largest city and a popular tourist destination.";

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 1.4;
    return Scaffold(
      key: _drawerKey,
      drawer: Menu(),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        new Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        HexToColor("#147EB1"),
                        HexToColor("#0A2387"),
                      ]),
                ),
                height: MediaQuery.of(context).size.height / 1.2,
                child: new Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () =>
                              _drawerKey.currentState.openDrawer()),
                      Row(children: <Widget>[
                        Text(
                          "Filtr8",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.asset("assets/Logo.png")
                      ]),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 80, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("\n\n\n\n"),
                            InkWell(
                                onTap: () {
                                  print("value of your text");
                                  setState(() {
                                    weight1 = 5400;
                                    weight2 = 3200;
                                    weight3 = 4100;
                                    today = false;
                                    month = true;
                                    week = true;
                                    num1 = 70;
                                    num2 = 50;
                                    num3 = 90;
                                  });
                                },
                                child: Text(
                                  "Today",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color:
                                          today ? Colors.white : Colors.yellow),
                                )),
                            InkWell(
                                onTap: () {
                                  print("value of your text");
                                  setState(() {
                                    weight1 = 6500;
                                    weight2 = 5800;
                                    weight3 = 4800;
                                    week = false;
                                    month = true;
                                    today = true;
                                    num1 = 80;
                                    num2 = 90;
                                    num3 = 77;
                                  });
                                },
                                child: Text(
                                  "Week",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color:
                                          week ? Colors.white : Colors.yellow),
                                )),
                            InkWell(
                                onTap: () {
                                  print("value of your text");
                                  setState(() {
                                    weight1 = 6900;
                                    weight2 = 7400;
                                    weight3 = 5500;
                                    month = false;
                                    week = true;
                                    today = true;
                                    num1 = 95;
                                    num2 = 95;
                                    num3 = 99;
                                  });
                                },
                                child: Text(
                                  "Month",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color:
                                          month ? Colors.white : Colors.yellow),
                                )),
                          ])),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 50, 80, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    text: '$name \n',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '$parish',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            new Row(children: <Widget>[
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    color: Colors.yellow,
                                    iconSize: 23.0,
                                    onPressed: () => Navigator.pop(context),
                                  )),
                              Text(
                                "Back",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.yellow),
                              )
                            ])
                          ])),
                  RiverChart(num1, num2, num3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          "Tier One ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          color: HexToColor('#126EE6'),
                        ),
                      ]),
                      Row(children: <Widget>[
                        Text("Tier Two ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        Column(children: <Widget>[
                          Container(
                            height: 10,
                            width: 10,
                            color: HexToColor('#3B2CBE'),
                          )
                        ]),
                      ]),
                      Row(children: <Widget>[
                        Text("Tier Three ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        Container(
                          height: 10,
                          width: 10,
                          color: HexToColor('#5016A8'),
                        ),
                      ])
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: '$weight1',
                          style: TextStyle(color: Colors.yellow, fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Kg',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              //recognizer: _longPressRecognizer,
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '$weight2',
                          style: TextStyle(color: Colors.yellow, fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Kg',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              //recognizer: _longPressRecognizer,
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '$weight3',
                          style: TextStyle(color: Colors.yellow, fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Kg',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              //recognizer: _longPressRecognizer,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ])),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, height, 0, 0),
                child: Stack(
                  children: <Widget>[
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250.0,
                        aspectRatio: 16.9,
                        viewportFraction: 0.7,
                      ),
                      items: widget.gullies.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    name = i['name'];
                                    parish = i['parish'];
                                  });
                                },
                                child: Container(
                                    width: 300,
                                    // height: 210,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 6,
                                            blurRadius: 7,
                                            offset: Offset(1,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    child: RichText(
                                      text: TextSpan(
                                        text: '${i['name']} \n\n',
                                        style: TextStyle(
                                            color: HexToColor("#0E4B99"),
                                            fontSize: 20),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '$description\n\n',
                                            style: TextStyle(
                                              color: HexToColor("#585858"),
                                              fontSize: 14,
                                            ),
                                            //recognizer: _longPressRecognizer,
                                          ),
                                          TextSpan(
                                            text: 'Visio 2030\n',
                                            style: TextStyle(
                                              color: HexToColor("#D1D10D"),
                                              fontSize: 14,
                                            ),
                                            //recognizer: _longPressRecognizer,
                                          ),
                                          TextSpan(
                                            text:
                                                'Help us make Jamaica the place of choice to live, work, raise families and do business.',
                                            style: TextStyle(
                                              color: HexToColor("#585858"),
                                              fontSize: 14,
                                            ),
                                            //recognizer: _longPressRecognizer,
                                          ),
                                        ],
                                      ),
                                    )));
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ))
          ],
        )
      ])),
    );
  }
}
