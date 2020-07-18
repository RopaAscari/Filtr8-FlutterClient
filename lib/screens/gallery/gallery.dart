import 'dart:io';
import 'dart:async';
import 'dart:convert';
import '../../widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../services/hexConverter.dart';
import '../../widgets/galleryContainer.dart';
import '../../widgets/galleryBottomContainer.dart';

class Gallery extends StatelessWidget {
  Gallery(
      {Key key,
      this.gullyname,
      this.gullycountry,
      this.gullyimage,
      this.gullyparish})
      : super(key: key);

  final String gullyname;
  final String gullyparish;
  final String gullycountry;
  final String gullyimage;

  //GalleryScreen createState() => GalleryScreen();

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Scaffold(
        key: _drawerKey,
        drawer: Menu(),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                      HexToColor("#147EB1"),
                      HexToColor("#0A2387")
                    ])),
                height: MediaQuery.of(context).size.height / 7,
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
                            onPressed: () => null),
                        Row(children: <Widget>[
                          Text(
                            "Filtr8",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Image.asset("assets/Logo.png")
                        ]),
                      ]),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Text(
                            "Gallery",
                            style: TextStyle(
                                fontSize: 27,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )))
                ]),
              ),
              new Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: '\n  $gullyname  | ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                          text: '$gullyparish, $gullycountry',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                              // decoration: TextDecoration.underline,
                              // decorationStyle: TextDecorationStyle.wavy,
                              ),
                          //recognizer: _longPressRecognizer,
                        ),
                      ],
                    ),
                  )),
              GalleryContainer(gullyimage),
              Text("\n"),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: GalleryBottomContainer()),
              Text("\nHelp us keep Jamaica clean",
                  style: TextStyle(fontSize: 19, color: HexToColor("#F24D4D"))),
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
