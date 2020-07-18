import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/hexConverter.dart';

class RiverStatisticsContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      // / //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     en Alignment.bottomRight,
//colors: [HexToColor("#147EB1"), HexToColor("#0A2387")]),
      //  borderRadius: BorderRadius.only(
      //    bottomRight: Radius.circular(30),
      //    bottomLeft: Rd:adius.circular(30))),
      //height: MediaQuery.of(context).size.height / 2,
      // width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height / 1.2,

      child: Stack(children: <Widget>[
        //  padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),

        Text("\n\n\n\n\n\n\n\n\n"),
        InkWell(
            onTap: () {
              print("fgfhjkdc");
            },
            child: Text(
              "\n\nToday",
              style: TextStyle(fontSize: 22, color: Colors.black),
            )),
        InkWell(
            onTap: () {
              print("fgfhjkdc");
            },
            child: Text(
              "\n\n\n\nWeek",
              style: TextStyle(fontSize: 22, color: Colors.black),
            )),
        InkWell(
            onTap: () {
              print("fgfhjkdc");
            },
            child: Text(
              "Month",
              style: TextStyle(fontSize: 22, color: Colors.white),
            )),

        Padding(
            padding: EdgeInsets.all(17.0),
            child: Text("\n\n\n\n\n\n\nJAMAICA CLEAN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600))),
      ]),
    );
  }
}
