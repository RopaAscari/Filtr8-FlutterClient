import 'package:flutter/material.dart';
import '../services//hexConverter.dart';

class GalleryBottomContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [HexToColor("#147EB1"), HexToColor("#0A2387")])),
        height: MediaQuery.of(context).size.height / 5.8,
        width: MediaQuery.of(context).size.width / 1.1,
      ),
      Row(children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "Vision 2020",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )),
        Image.asset("assets/Flag.png")
      ]),
      Padding(
          padding: const EdgeInsets.all(40.3),
          child: Text(
            "\nThe comprehensive vision of the national development plan is to make Jamaica the place of choice to live, work, raise families and do business.",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ))
    ]);
  }
}
