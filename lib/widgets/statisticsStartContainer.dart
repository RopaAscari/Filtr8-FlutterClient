import 'package:flutter/material.dart';
import '../services/hexConverter.dart';

class StatStartContainer extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey;
  StatStartContainer(this._drawerKey);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [HexToColor("#147EB1"), HexToColor("#0A2387")])),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4.3,
        child: new Stack(children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 0, 10),
                  child: IconButton(
                    iconSize: 34,
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () => _drawerKey.currentState.openDrawer(),
                  )),
              //Image.asset(logoPath)
              Row(
                children: <Widget>[
                  Text(
                    "Filtr8",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Image.asset('assets/Logo.png')
                ],
              )
            ],
          ),
          new Align(
              alignment: Alignment.center,
              child: Column(children: <Widget>[
                Text("\n\nStatistics",
                    style: TextStyle(fontSize: 33, color: Colors.white)),
                Icon(
                  Icons.share,
                  color: Colors.grey,
                  size: 26.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                // Text("\n\nddd")
              ])),
          new Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child: Text(
                    "Showing the best three of all locations",
                    style: TextStyle(fontSize: 15),
                  ))),
        ]));
  }
}
