import 'dart:async';
import '../services/hexConverter.dart';
//import '../../services/api.dart';
//import 'package:loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:filtr8/widgets/imageContainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:loading/indicator/ball_pulse_indicator.dart';

class Menu extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                      HexToColor("#147EB1"),
                      HexToColor("#0A2387")
                    ])),
                child: ListView(children: [
                  ListTile(
                      title: Row(
                    children: <Widget>[
                      Text(
                        "Filtr8",
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset("assets/whiteIcon.png")
                    ],
                  )),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(30, 70, 0, 0),
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Align(
                      child: Text("Home",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      alignment: Alignment(-1.3, 0),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    leading: Icon(
                      Icons.equalizer,
                      color: Colors.white,
                    ),
                    title: Align(
                      child: Text("Statistics",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      alignment: Alignment(-1.3, 0),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/statistics');
                      //Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Align(
                      child: Text("About Us",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      alignment: Alignment(-1.3, 0),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(80, 500, 0, 0),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: Align(
                      child: Text("Settings",
                          style: TextStyle(color: Colors.white, fontSize: 21)),
                      alignment: Alignment(-1.6, 0),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                ])),
          )
        ],
      ),
    );
  }
}
