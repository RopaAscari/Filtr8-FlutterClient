import 'dart:convert';

import 'package:flutter/material.dart';
import '../../services/hexConverter.dart';
import '../../widgets/drawer.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key, key, this.title}) : super(key: key);

  final String title;

  AboutUsScreen createState() => AboutUsScreen();
}

@override
class AboutUsScreen extends State<AboutUs> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer: Menu(),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [HexToColor("#147EB1"), HexToColor("#0A2387")])),
            height: MediaQuery.of(context).size.height / 4.8,
            child: new Stack(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => _drawerKey.currentState.openDrawer()),
                    Row(children: <Widget>[
                      Text(
                        "Filtr8",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Image.asset("assets/Logo.png")
                    ]),
                  ]),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "     About\nProject Filtr8",
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ))
            ]),
          ),
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                'The Vision',
                style: TextStyle(fontSize: 30),
              )),
          Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusaLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusa",
                style: TextStyle(fontSize: 18),
              )),
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
          ])
        ])));
  }
}
