import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:filtr8/screens/gallery/gallery.dart';
import 'package:filtr8/screens/river-statistics/riverStatistics.dart';
import 'package:filtr8/screens/statistics/statistics.dart';
import '../../widgets/drawer.dart';
import '../../services/api.dart';
import 'package:flutter/material.dart';
import '../../services/hexConverter.dart';
import '../../widgets/imageContainer.dart';
import 'package:filtr8/widgets/imageContainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:loading/indicator/ball_pulse_indicator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  bool loading = true;
  List<dynamic> gullies;

  @override
  void initState() {
    gully();
    super.initState();
  }

  @override
  void dispose() {
    gully();
    super.dispose();
  }

  void gully() {
    Api().getGully().then((gully) {
      setState(() {
        gullies = gully;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.5;
    double height = MediaQuery.of(context).size.height / 2.1;
    return Scaffold(
      key: _drawerKey,
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                ImageContainer("assets/Filtr8.png", _drawerKey),
                Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(width, height, 0, 0),
                    child: new FlatButton(
                        color: HexToColor('#105DA2'),
                        child: new Text('Vision 2030',
                            style: TextStyle(color: Colors.white)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () => null)),
              ],
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  '\n\nThe comprehensive vision of the national development plan is to make Jamaica the place of choice to live, work, raise families and do business.',
                  style: TextStyle(fontSize: 18),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: FlatButton(
                      color: HexToColor("#105DA2"),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(7.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(6.0)),
                      onPressed: () {
                        gully();
                      },
                      child: Text(
                        "Project Locations",
                      ),
                    ))),
            loading
                ? new CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  )
                : CarouselSlider(
                    options: CarouselOptions(
                      height: 100.0,
                      aspectRatio: 20.0,
                      viewportFraction: 0.35,
                      //   autoPlay: false,
                      //  autoPlayInterval: Duration(seconds: 3),
                      //  autoPlayAnimationDuration: Duration(milliseconds: 800),
                      //  autoPlayCurve: Curves.fastOutSlowIn,
                      //pauseAutoPlayOnTouch: Duration(seconds: 10),
                    ),
                    items: gullies.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Gallery(
                                      gullyname: i['name'],
                                      gullyparish: i['parish'],
                                      gullyimage: i['images'],
                                      gullycountry: i['country'],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                  width: 110,
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
                                      borderRadius: BorderRadius.circular(20)),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                    '${i['name']}',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.center,
                                  )));
                        },
                      );
                    }).toList(),
                  ),
            Text("\n\n\n\n"),
            Container(
                child: new ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                  new FlatButton(
                    color: HexToColor('#147EB1'),
                    child: new Text('View Project Statistics'),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Statistics(gullies: gullies),
                        ),
                      );
                    },
                  ),
                  Text("         "),
                  new FlatButton(
                    color: HexToColor('#147EB1'),
                    child: new Text('View River Statistics'),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RiverStatistics(gullies: gullies),
                        ),
                      );
                    },
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
